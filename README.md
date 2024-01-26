# IPCP
The immediate ceiling priority protocol (ICPP) is a simplified version of PCP. Similar to PCP each semaphore has an assigned priority ceiling which is the highest priority of the tasks that can lock it.
However, ICPP differs from PCP in that the priority of a task is elevated immediately to the priority ceiling when the task acquires the semaphore, regardless of whether another task attempts a conflicting access. Similarly, the priority is restored to the previous priority as soon as the lock on the resource is released

# Task
![image](https://github.com/shashaaankk/RTC_IPCP/assets/54775855/3f02511e-f39f-414e-bec9-84c4e60ab662)
The time of locking L(X) indicates after how much time units of its execution, the task will try to lock resource X, i.e. acquire a semaphore. The time of unlocking U(X) indicates after how much time units of its execution, the task will release the lock on resource X. Locking and unlocking times depend on the number of time units the task has been actually executing
# 1. Setup
## 1.1 Linux
1. Install CMake via [insert your favorite packet manager here]
2. (Optional, but highly recommended) Install neovim
3. Run the example application
    ``` console
        $ mkdir build && cd build
        $ cmake [-DEXAMPLE=1] ..
            -- The C compiler identification is GNU 13.2.1
            [...]
        $ cmake --build .
            [  6%] Building C object src/portable/CMakeFiles/freertos_kernel_port.dir/Posix/port.c.o
            [...]
        $ ./example/example 
            Message received from task
            [...]
    ```

## 1.2 Windows
1. Install mingw from http://sourceforge.net/projects/mingw/ 
    - mark `mingw32-base` and `mingw32-gcc-g++` for installation
    - in the `Installation` menu, press `Apply Changes`
2. Add mingw to PATH
    - e.g. add `C:\MinGW\bin` to PATH
3. Install CMake from https://cmake.org/download/
4. Test the setup and paths
    - run `gcc --version`
    - run `cmake --version`
5. Open the project, e.g., in VSCode
6. Run the example application
    ``` powershell
        PS C:\Users\User\Desktop\rtc_freertos> mkdir build
            [...]
        PS C:\Users\User\Desktop\rtc_freertos> cd build
            [...]
        PS C:\Users\User\Desktop\rtc_freertos\build> cmake -G "MinGW Makefiles" [-DEXAMPLE=1] ..
            -- The C compiler identification is GNU 6.3.0
            [...]

        PS C:\Users\User\Desktop\rtc_freertos\build> cmake --build .
            [  7%] Building C object src/portable/CMakeFiles/freertos_kernel_port.dir/MSVC-MingW/port.c.obj
            [...]
        PS C:\Users\User\Desktop\rtc_freertos\build> .\example\example.exe
            Message received from task
            [...]
    ```
