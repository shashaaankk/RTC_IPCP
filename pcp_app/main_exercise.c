/*
 * FreeRTOS Kernel V10.1.1
 * Copyright (C) 2018 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * http://www.FreeRTOS.org
 * http://aws.amazon.com/freertos
 *
 * 1 tab == 4 spaces!
 */

/******************************************************************************
 * NOTE: Windows will not be running the FreeRTOS demo threads continuously, so
 * do not expect to get real time behaviour from the FreeRTOS Windows port, or
 * this demo application.  Also, the timing information in the FreeRTOS+Trace
 * logs have no meaningful units.  See the documentation page for the Windows
 * port for further information:
 * http://www.freertos.org/FreeRTOS-Windows-Simulator-Emulator-for-Visual-Studio-and-Eclipse-MingW.html
 *
 ******************************************************************************
 *
 * NOTE:  Console input and output relies on Windows system calls, which can
 * interfere with the execution of the FreeRTOS Windows port.  This demo only
 * uses Windows system call occasionally.  Heavier use of Windows system calls
 * can crash the port.
 */

/* Standard includes. */
#include <stdio.h>

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"

#define mainNUMBER_OF_SEMAPHORS (3)
#define RESOURCE_NOT_NEEDED     (255)

//Priority Ceiling
#define PRIORITY_CEILING_A  4
#define PRIORITY_CEILING_B  5
#define PRIORITY_CEILING_C  5

#define DEFAULT 255
#define NUM_TASKS 4
#define MAX_SEM_NESTING 4

// Semaphore structure with priority ceiling
typedef struct {
    SemaphoreHandle_t resourceLock;
    uint8_t isFree;
    uint8_t priorityCeiling;
    const char* resourceName;
    TaskHandle_t CurrTask;
    uint8_t CurrTaskPrio;
    uint8_t elevatedPrioCeiling;
    TaskHandle_t WaitingTask;
    uint8_t index;
} Semaphore_t;

//Given Task Table for ICPP
//Task Parameters
typedef struct {
	char TaskName[5];
     uint8_t taskIndex;
	uint8_t priority;              //ActivePriority
	uint8_t release;
	uint8_t exetime;
	uint8_t a_lock;
	uint8_t a_unlock;
	uint8_t b_lock;
	uint8_t b_unlock;
	uint8_t c_lock;
	uint8_t c_unlock;
	uint8_t originalPriority;
     uint8_t gotSemaphore;
    int stackTop;                           // Index of the top of the stack
    uint8_t priorityStack[MAX_SEM_NESTING]; // Stack to store priorities
    Semaphore_t* BlockedOnSemaphore;        // Semaphore that the task is blocked on due to priority ceiling 
}Task_t;

//Array of Tasks
//Index 0 = Task 1; Index 1 = Task 2; Index 2 = Task 3; Index 3 = Task 4
Task_t taskList[5] = {
	{"T1", 0, 5, 10, 5,RESOURCE_NOT_NEEDED, RESOURCE_NOT_NEEDED,1, 2, 3, 4, 5, 0, -1},
	{"T2", 1, 4, 3, 7, 5, 6, RESOURCE_NOT_NEEDED, RESOURCE_NOT_NEEDED, 1, 3, 4, 0, -1},
	{"T3", 2, 3, 5, 8, 3, 5, 2, 7, RESOURCE_NOT_NEEDED, RESOURCE_NOT_NEEDED, 3, 0, -1},
	{"T4", 3, 2, 0, 9, 2, 8, 4, 6, RESOURCE_NOT_NEEDED, RESOURCE_NOT_NEEDED, 2, 0, -1},
	{"SYS",4, 1, 0, 0, RESOURCE_NOT_NEEDED,RESOURCE_NOT_NEEDED,RESOURCE_NOT_NEEDED,RESOURCE_NOT_NEEDED,RESOURCE_NOT_NEEDED,RESOURCE_NOT_NEEDED,1,0}
};

TaskHandle_t Tasks_Handle[4];

Semaphore_t A;
Semaphore_t B;
Semaphore_t C;

typedef struct {
    Semaphore_t* semaphore;
    uint8_t isBlocked;
} BlockedSemaphoreTracker_t;

BlockedSemaphoreTracker_t blockedSemaphoreTracker[mainNUMBER_OF_SEMAPHORS];

//Global Variables
uint8_t semaphoreA = 0U;
uint8_t semaphoreB = 1U;
uint8_t semaphoreC = 2U;
uint8_t task1Index = 0;
uint8_t task2Index = 1;
uint8_t task3Index = 2;
uint8_t task4Index = 3;

static uint8_t systemCeiling = 1U;
static uint8_t sysCeilByTask = 255U; //Default
static uint8_t firstEntry = 1U;

//#define workersUSELESS_CYCLES_PER_TIME_UNIT (1000000000UL)
#define workersUSELESS_CYCLES_PER_TIME_UNIT	( 1000000UL)
#define CUSTOM_STACK_SIZE (configMINIMAL_STACK_SIZE*4)

//uint8_t notifyBlockedTasks[mainNUMBER_OF_SEMAPHORS] = {0};
/*-----------------------------------------------------------*/
//Function Prototypes
UBaseType_t usPrioritySemaphoreWait(Semaphore_t *semaphore, Task_t *task); //Wrapper
UBaseType_t usPrioritySemaphoreSignal(Semaphore_t *semaphore, Task_t *task); //Wrapper
void initializeSemaphores(void);
static void vUselessLoad(uint32_t ulCycles);
static void prvTask1(void *pvParameters);
static void prvTask2(void *pvParameters);
static void prvTask3(void *pvParameters);
static void prvTask4(void *pvParameters);

/*-----------------------------------------------------------*/
//Helper Functions for Debugging
eTaskState GetTask1State() {
    return eTaskGetState(Tasks_Handle[task1Index]);
}

uint32_t getCurrentTimeInSeconds() {
    TickType_t currentTicks = xTaskGetTickCount();
    return (float)currentTicks / (float)configTICK_RATE_HZ;
}
/*-----------------------------------------------------------*/

void main_exercise(void)
{   

    /*Initialization
    A mutex type semaphore that will be  used to control access to a shared resource, ensuring that only one task can access the resource at a time.*/
    A.resourceLock = xSemaphoreCreateMutex();
    A.isFree = pdTRUE;
    A.priorityCeiling = PRIORITY_CEILING_A;
    A.resourceName = "A";
    A.CurrTask = NULL;
    A.CurrTaskPrio = DEFAULT;
    A.elevatedPrioCeiling = A.priorityCeiling;
    A.WaitingTask = NULL;
    A.index = 0U;


    B.resourceLock = xSemaphoreCreateMutex();
    B.isFree = pdTRUE;
    B.priorityCeiling = PRIORITY_CEILING_B;
    B.resourceName = "B";
    B.CurrTask = NULL;
    B.CurrTaskPrio = DEFAULT;
    B.elevatedPrioCeiling = B.priorityCeiling;
    B.WaitingTask = NULL;
    B.index = 1U;


    C.resourceLock = xSemaphoreCreateMutex();
    C.isFree = pdTRUE;
    C.priorityCeiling = PRIORITY_CEILING_C;
    C.resourceName = "C";
    C.CurrTask = NULL;
    C.CurrTaskPrio = DEFAULT;
    C.elevatedPrioCeiling = C.priorityCeiling;
    C.WaitingTask = NULL;
    C.index = 2U;

    blockedSemaphoreTracker[0].semaphore = &A; // Pointer to semaphore A
    blockedSemaphoreTracker[1].semaphore = &B; // Pointer to semaphore B
    blockedSemaphoreTracker[2].semaphore = &C; // Pointer to semaphore C

    for (int i = 0; i < 4U; i++)            //No Task is Blocked on a Semaphore
    { 
    taskList[i].BlockedOnSemaphore = NULL;
    }

    for (int i = 0; i < mainNUMBER_OF_SEMAPHORS; i++)
    {
        blockedSemaphoreTracker[i].isBlocked = 0;
    }

    xTaskCreate(prvTask4, "Task4", CUSTOM_STACK_SIZE, (void*)&taskList[task4Index], taskList[task4Index].priority, &Tasks_Handle[task4Index]);
    xTaskCreate(prvTask3, "Task3", configMINIMAL_STACK_SIZE, (void*)&taskList[task3Index], taskList[task3Index].priority, &Tasks_Handle[task3Index]);
    xTaskCreate(prvTask2, "Task2", CUSTOM_STACK_SIZE, (void*)&taskList[task2Index], taskList[task2Index].priority, &Tasks_Handle[task2Index]);
    xTaskCreate(prvTask1, "Task1", configMINIMAL_STACK_SIZE, (void*)&taskList[task1Index], taskList[task1Index].priority, &Tasks_Handle[task1Index]);

    vTaskStartScheduler();
    printf("After starting the scheduler (this point should not be reached)\n");

    for (;;)
    {
        printf("Inside infinite loop (this point should not be reached)\n");
    }
}
/*-----------------------------------------------------------*/

static void vUselessLoad(const uint32_t seconds) {
    volatile uint32_t i; // Declaring a volatile variable to prevent optimization
    uint64_t ulUselessVariable = 0;
    const uint32_t totalCycles = seconds * workersUSELESS_CYCLES_PER_TIME_UNIT * 1000;//hz equivalent to 1s

    for (i = 0; i < totalCycles; i++) {
        // ulUselessVariable = 0;     //Eating up time
		// ulUselessVariable = ulUselessVariable + 1;
    }
}

static void prvTask1(void *pvParameters)
{
    Task_t *taskData = (Task_t *)pvParameters;
    const TickType_t xPeriod = pdMS_TO_TICKS(100000); // Set period to 10 seconds
    const TickType_t xRelease = pdMS_TO_TICKS(10 * 1000);
    TickType_t xLastWakeTime = xTaskGetTickCount(); // Get the current tick count
    //calibrateUselessLoad();
    for (;;) {
    vTaskDelayUntil(&xLastWakeTime, xRelease);
    printf("Task 1 started operatoin at %d\n",getCurrentTimeInSeconds());
    vTaskDelay(100); //To Accomidate Schnanigans of Tasks
    // 1 Unit of Normal Execution
    vUselessLoad(1);                         
    // Calling Wait on B
    usPrioritySemaphoreWait(&B,&taskList[task1Index]);
    vTaskDelay(10); 
    // 1 Unit of Execution with B
    vUselessLoad(1);
    //Signalling B
    usPrioritySemaphoreSignal(&B,&taskList[task1Index]);
    vTaskDelay(10); 
    // 1 More Unit of Normal Execution
    vUselessLoad(1);
    // Calling Wait on C
    usPrioritySemaphoreWait(&C,&taskList[task1Index]);
    vTaskDelay(10); 
    // 1 Unit of Execution with C
    vUselessLoad(1);
    //Signalling C
    usPrioritySemaphoreSignal(&C,&taskList[task1Index]);
    vTaskDelay(10); 
    // 1 More Unit of Normal Execution
    vUselessLoad(1);
    // Wait for the next cycle
    vTaskDelayUntil(&xLastWakeTime, xPeriod);

    }
}

static void prvTask2(void *pvParameters)
{   
    Task_t *taskData = (Task_t *)pvParameters;
    const TickType_t xPeriod = pdMS_TO_TICKS(100000); // Set period to 10 seconds
    const TickType_t xRelease = pdMS_TO_TICKS(3 * 1000);
    TickType_t xLastWakeTime = xTaskGetTickCount(); // Get the current tick count
    //calibrateUselessLoad();
    for (;;) {
    vTaskDelayUntil(&xLastWakeTime, xRelease);
    printf("Task 2 started operatoin at %d\n",getCurrentTimeInSeconds());
    // 1 Unit of Normal Execution
    vUselessLoad(1);                         
    // Calling Wait on C
    usPrioritySemaphoreWait(&C,&taskList[task2Index]);
    // 2 Unit of Execution with C
    vUselessLoad(2);
    //Signalling C
    usPrioritySemaphoreSignal(&C,&taskList[task2Index]);
    // 2 More Unit of Normal Execution
    vUselessLoad(2);
    // Calling Wait on A
    usPrioritySemaphoreWait(&A,&taskList[task2Index]);
    // 1 Unit of Execution with A
    vUselessLoad(1);
    //Signalling A
    usPrioritySemaphoreSignal(&A,&taskList[task2Index]);
    // 1 More Unit of Normal Execution
    vUselessLoad(1);
    // Wait for the next cycle
    vTaskDelayUntil(&xLastWakeTime, xPeriod);
    }
}

static void prvTask3(void *pvParameters)
{
    Task_t *taskData = (Task_t *)pvParameters;
    const TickType_t xPeriod = pdMS_TO_TICKS(100000); // Set period to 10 seconds
    const TickType_t xRelease = pdMS_TO_TICKS(5 * 1000);
    TickType_t xLastWakeTime = xTaskGetTickCount(); // Get the current tick count
    //calibrateUselessLoad();
    for (;;) {
    vTaskDelayUntil(&xLastWakeTime, xRelease);
    printf("Task 3 started operatoin at %d\n",getCurrentTimeInSeconds());
    // 2 Units of Normal Execution
    vUselessLoad(1);
    vUselessLoad(1);                         
    // Calling Wait on B
    usPrioritySemaphoreWait(&B,&taskList[task3Index]); 
    // 1 Unit of Execution with B
    vUselessLoad(1);  
    // Calling Wait on A
    usPrioritySemaphoreWait(&A,&taskList[task3Index]);
    // 2 Unit of Execution with A
    vUselessLoad(1);
    vUselessLoad(1);     
    //Signalling A
    usPrioritySemaphoreSignal(&A,&taskList[task3Index]);
    vTaskDelay(10); 
    // 2 More Unit of Execution with B
    vUselessLoad(1);
    vUselessLoad(1);     
    //Signalling B
    usPrioritySemaphoreSignal(&B,&taskList[task3Index]);
    vTaskDelay(10); 
    // 1 More Unit of Normal Execution
    vUselessLoad(1);   
    // Wait for the next cycle
    vTaskDelayUntil(&xLastWakeTime, xPeriod);
    }
}

static void prvTask4(void *pvParameters)
{
    Task_t *taskData = (Task_t *)pvParameters;
    const TickType_t xPeriod = pdMS_TO_TICKS(100000); // Set period to 10 seconds
    const TickType_t xRelease = pdMS_TO_TICKS(1);   //Ignoring as Release Time is 0
    TickType_t xLastWakeTime = xTaskGetTickCount(); // Get the current tick count
    //calibrateUselessLoad();
    for (;;) {
    printf("Task 4 started operatoin at %d\n",getCurrentTimeInSeconds());
    // 2 Unit of Normal Execution
    vUselessLoad(2);                         
    // Calling Wait on A
    usPrioritySemaphoreWait(&A,&taskList[task4Index]);
    // 2 Unit of Execution with A
    vUselessLoad(2);     
    // Calling Wait on B
    usPrioritySemaphoreWait(&B,&taskList[task4Index]);
    // 2 Unit of Execution with B
    vUselessLoad(2); 
    //Signalling B
    usPrioritySemaphoreSignal(&B,&taskList[task4Index]);
    // 2 More Unit of Execution with A
    vUselessLoad(2);  
    //Signalling A
    usPrioritySemaphoreSignal(&A,&taskList[task4Index]);
    // 1 More Unit of Normal Execution
    vUselessLoad(1);   
    printf(">END OF CYCLE!<\n");
    // Wait for the next cycle
    vTaskDelayUntil(&xLastWakeTime, xPeriod);

    }  
}
/**
 * semaphoreIndex 0 => Resource A
 * semaphoreIndex 1 => Resource B
 * semaphoreIndex 2 => Resource C
*/
UBaseType_t usPrioritySemaphoreWait(Semaphore_t *semaphore, Task_t *task) 
{   
    //printf("Wait Function Entered\n");
    uint8_t originalPriority = task->priority;                                               // Original Priority for Safe Keeping
    uint8_t newPriority = 0;
    uint8_t elevatedNewPriority = 0;
    	
    //printf("Checking for Valid Semaphore\n");
    if (semaphore->resourceLock == NULL)                                                     // Check for valid semaphore
    {   
        printf("Valid Semaphore Does Not Exist\n");
        return pdFALSE;
    }
    if (firstEntry == 0)
    	{
		printf("Task Priority of Current Task <%s> is: (%d). The System Ceiling (%d), caused by <%s>\n", task->TaskName, task->priority, systemCeiling, taskList[sysCeilByTask].TaskName);
	}
		
    if (task->priority > systemCeiling)                                                  // Check task priority against system ceiling
    {   
	   firstEntry = 0;
        if (xSemaphoreTake(semaphore->resourceLock, portMAX_DELAY) != pdFALSE)           // Lock the resource
        {  
	       task->gotSemaphore = 1U;
            //printf("Resource Granted! Changing Priority\n");
            semaphore->CurrTask = Tasks_Handle[task->taskIndex];                         //For Signalling
            // Change Task Priority
            newPriority = semaphore->priorityCeiling;                                    // Set to priority ceiling
            task->priority = newPriority;
            
            // Stack for Priority Tracking
            if (task->stackTop < MAX_SEM_NESTING - 1) 
            {
                task->priorityStack[++task->stackTop] = task->priority;                  // Push current priority
                //printf("Pushed %d\n", newPriority);
            }

            semaphore->CurrTaskPrio = task->priority;                                   // Store current priority
            semaphore->isFree = pdFALSE;                                                // Semaphore is taken
            systemCeiling = semaphore->priorityCeiling;                                 // Update system ceiling
            sysCeilByTask = task->taskIndex;                                            // Calculate the task index

            // Update the task's priority in FreeRTOS
            vTaskPrioritySet(Tasks_Handle[task - taskList], semaphore->priorityCeiling);
            // Keeping the task structure in sync with the new priority
            task->priority = newPriority;

            printf("Task <%s> acquired resource <%s> and changed its priority from <%d> to <%d> at %d\n",
                    task->TaskName, semaphore->resourceName, originalPriority, newPriority, getCurrentTimeInSeconds());
        } 
        else
        {
            printf("Failed to Lock Resource\n");
        }  
    }
    else if ((task->priority <=  systemCeiling) && (sysCeilByTask == task->taskIndex))
    {
        //printf("System Ceiling Caused by the Requesting Task\n");            
        if (xSemaphoreTake(semaphore->resourceLock, portMAX_DELAY) != pdFALSE)           // Lock the resource
        { 
            //printf("Resource Granted! Changing Priority if need be\n");
		  task->gotSemaphore = 1U;
            semaphore->CurrTask = Tasks_Handle[task->taskIndex];                         //For Signalling
            newPriority = semaphore->priorityCeiling;
            if(task->priority < semaphore->priorityCeiling)
            {
                task->priority = newPriority;
                // Stack for Priority Tracking
                if (task->stackTop < MAX_SEM_NESTING - 1) 
                {
                    task->priorityStack[++task->stackTop] = task->priority;                 // Push current priority
                } 
                semaphore->CurrTaskPrio = task->priority;                                   // Store current priority
                semaphore->isFree = pdFALSE;                                                // Semaphore is taken
                systemCeiling = semaphore->priorityCeiling;                                 // Update system ceiling
                // Update the task's priority in FreeRTOS
                vTaskPrioritySet(Tasks_Handle[task - taskList], semaphore->priorityCeiling); 
                // Keeping the task structure in sync with the new priority
                task->priority = newPriority;
                printf("Task <%s> acquired resource <%s> and changed its priority from <%d> to <%d> at %d\n",
                task->TaskName, semaphore->resourceName, originalPriority, newPriority, getCurrentTimeInSeconds());
            }
            else
              {   
                if (task->stackTop < MAX_SEM_NESTING - 1) 
                {
                    task->priorityStack[++task->stackTop] = task->priority;                 // Push Previous(unchanged) priority
                }
                // Update the task's priority in FreeRTOS
                vTaskPrioritySet(Tasks_Handle[task - taskList], semaphore->priorityCeiling); 
                printf("Task <%s> acquired resource <%s> and retained its priority <%d> at %d\n",
                task->TaskName, semaphore->resourceName, originalPriority, getCurrentTimeInSeconds());
               }
          }  
        else
        {   
            // Update the task's priority in FreeRTOS
            vTaskPrioritySet(Tasks_Handle[task - taskList], semaphore->priorityCeiling); 
            printf("Task Already has Access to Requested Resource or Something Wrong!");
            return pdFALSE;
        }  
     }
	else if((task->priority == systemCeiling && sysCeilByTask != task->taskIndex))
	{   
        uint8_t semaphoreIndex = semaphore->index; // Determine the index of the semaphore
        //notifyBlockedTasks[semaphoreIndex] = 1;
     	// logic to wait for the semaphore to and then attempt to lock it
		task->BlockedOnSemaphore = semaphore; // Set the blocked semaphore
        //Logic to identify semaphore index
        // uint8_t semaphoreIndex = -1;
        // for (int i = 0; i < mainNUMBER_OF_SEMAPHORS; i++) {
        //     if (blockedSemaphoreTracker[i].semaphore == semaphore) {
        //         semaphoreIndex = i;
        //         break;
        //     }
        // }

        // // Set the semaphore as blocked
        // if (semaphoreIndex != -1) {
        blockedSemaphoreTracker[semaphoreIndex].isBlocked = 1;
        printf("Blocked Semaphore Tracker Updated. Index %d Blocked (0:A;1:B;2:C).\n", semaphoreIndex);
        // }

		//semaphore->WaitingTask = Tasks_Handle[task->taskIndex]; // Set the waiting task
   		printf("Task <%s> is waiting for semaphore <%s> since %d as the task is not causing the ceiling\n", task->TaskName, semaphore->resourceName,getCurrentTimeInSeconds());

    	// Wait for a notification
    	xTaskNotifyWait(0x00, ULONG_MAX, NULL, portMAX_DELAY);

    	semaphore->WaitingTask = NULL; // Clear the waiting task
    	return usPrioritySemaphoreWait(semaphore, task); // Retry acquiring the semaphore

	}
}

 UBaseType_t usPrioritySemaphoreSignal(Semaphore_t *semaphore, Task_t *task)
{  
    uint8_t restoredPriority = task->originalPriority;
    uint8_t lostPriority = DEFAULT;
    boolean TaskCausedSysCeilFlg = pdFALSE;
    uint8_t dummyVarForDebug = 4U;

    if (semaphore->resourceLock == NULL)                                                                // Check for valid semaphore
    {   
        printf("Valid Semaphore Does Not Exist\n");
        return pdFALSE;
    } 
    // Check if the task attempting to release the semaphore is the one that holds it
    if (semaphore->CurrTask != Tasks_Handle[task->taskIndex]) {
        printf("Error: Task %s attempted to release semaphore %s which it does not hold on\n",
               task->TaskName, semaphore->resourceName);
        return pdFAIL;
    }
	//Waiting tasks
    //@instant 9 since there is no task that has requested resource A this won't be executed.
    // if(semaphore->WaitingTask != NULL) 
	// {	
	// 	printf("Previously Requested Semaphore NOW being freed!\n");
    // 		xTaskNotify(semaphore->WaitingTask, 0x01, eNoAction);
	// }
    if (task->taskIndex == sysCeilByTask) 
    {
        TaskCausedSysCeilFlg = pdTRUE;
        dummyVarForDebug = sysCeilByTask;
    }

   if (task->stackTop >= 0) 
    {
        // Get and pop the current top priority
        lostPriority = task->priorityStack[task->stackTop];
        task->stackTop--;

        if (task->stackTop >= 0) 
        {
            // If there are more priorities in the stack, get the next one
            restoredPriority = task->priorityStack[task->stackTop] ;
            systemCeiling =  restoredPriority;
        }
        else
        {
            // If the stack is now empty, restore to the original priority
            restoredPriority = task->originalPriority;
            systemCeiling =  1U;
		    sysCeilByTask =  4U;
		  
        }
    }
    /*
    First identify which semaphores have waiting tasks (due to being indirectly blocked by the system ceiling) 
    and then iterate over the task list to notify the tasks that are waiting for these semaphores
    */
    if (systemCeiling == 1) {
        //printf("Checking for blocked semaphores to release.\n");
        for (int semIndex = 0; semIndex < mainNUMBER_OF_SEMAPHORS; semIndex++) {
            //printf("Blocked Semaphore at index %d\n",blockedSemaphoreTracker[semIndex]);
            if (blockedSemaphoreTracker[semIndex].isBlocked) {
                //printf("Semaphore at index %d has blocked tasks Releasing tasks (0:A;1:B;2:C)\n", semIndex);
                for (int taskIndex = 0; taskIndex < NUM_TASKS; taskIndex++) {
                    if (taskList[taskIndex].BlockedOnSemaphore == blockedSemaphoreTracker[semIndex].semaphore) {
                        printf("Signalling task <%s> which was blocked on semaphore After Release of Current Semaphore!\n", taskList[taskIndex].TaskName);
                        xTaskNotify(Tasks_Handle[taskIndex], 0x01, eNoAction);
                        taskList[taskIndex].BlockedOnSemaphore = NULL;
                    }
                }
                blockedSemaphoreTracker[semIndex].isBlocked = 0; // Reset the flag
            }
        }
    }
                          
    printf("Task <%s> released semaphore <%s> and restored its priority from <%d> to <%d> at %d. The system Ceiling is , <%d> by <%s>\n", 
           task->TaskName, semaphore->resourceName, lostPriority, restoredPriority, getCurrentTimeInSeconds(), systemCeiling, taskList[sysCeilByTask].TaskName);
    
    xSemaphoreGive(semaphore->resourceLock);
    semaphore->isFree = pdTRUE;
    semaphore->CurrTask = NULL;
    vTaskPrioritySet(Tasks_Handle[task - taskList], restoredPriority);
    // Keeping the task structure in sync with the restored priority
    task->priority = restoredPriority;

    return pdTRUE;
}
/*
B.
The key challenge is to identify when a task that caused a priority ceiling (and therefore potentially blocked other tasks) is done with its operations 
(i.e., when it's back to its original priority and the system ceiling is 1). usPrioritySemaphoreSignal is called by task which wants to release a semaphore.
A task that causes the priority ceiling will never call signal on a semaphore it has priority blocked*/