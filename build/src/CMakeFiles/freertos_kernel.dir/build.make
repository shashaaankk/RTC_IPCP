# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build"

# Include any dependencies generated for this target.
include src/CMakeFiles/freertos_kernel.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/freertos_kernel.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/freertos_kernel.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/freertos_kernel.dir/flags.make

src/CMakeFiles/freertos_kernel.dir/croutine.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/croutine.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/croutine.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/croutine.c
src/CMakeFiles/freertos_kernel.dir/croutine.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/freertos_kernel.dir/croutine.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/croutine.c.obj -MF CMakeFiles\freertos_kernel.dir\croutine.c.obj.d -o CMakeFiles\freertos_kernel.dir\croutine.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\croutine.c"

src/CMakeFiles/freertos_kernel.dir/croutine.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/croutine.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\croutine.c" > CMakeFiles\freertos_kernel.dir\croutine.c.i

src/CMakeFiles/freertos_kernel.dir/croutine.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/croutine.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\croutine.c" -o CMakeFiles\freertos_kernel.dir\croutine.c.s

src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/event_groups.c
src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj -MF CMakeFiles\freertos_kernel.dir\event_groups.c.obj.d -o CMakeFiles\freertos_kernel.dir\event_groups.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\event_groups.c"

src/CMakeFiles/freertos_kernel.dir/event_groups.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/event_groups.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\event_groups.c" > CMakeFiles\freertos_kernel.dir\event_groups.c.i

src/CMakeFiles/freertos_kernel.dir/event_groups.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/event_groups.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\event_groups.c" -o CMakeFiles\freertos_kernel.dir\event_groups.c.s

src/CMakeFiles/freertos_kernel.dir/list.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/list.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/list.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/list.c
src/CMakeFiles/freertos_kernel.dir/list.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/freertos_kernel.dir/list.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/list.c.obj -MF CMakeFiles\freertos_kernel.dir\list.c.obj.d -o CMakeFiles\freertos_kernel.dir\list.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\list.c"

src/CMakeFiles/freertos_kernel.dir/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/list.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\list.c" > CMakeFiles\freertos_kernel.dir\list.c.i

src/CMakeFiles/freertos_kernel.dir/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/list.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\list.c" -o CMakeFiles\freertos_kernel.dir\list.c.s

src/CMakeFiles/freertos_kernel.dir/queue.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/queue.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/queue.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/queue.c
src/CMakeFiles/freertos_kernel.dir/queue.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/freertos_kernel.dir/queue.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/queue.c.obj -MF CMakeFiles\freertos_kernel.dir\queue.c.obj.d -o CMakeFiles\freertos_kernel.dir\queue.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\queue.c"

src/CMakeFiles/freertos_kernel.dir/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/queue.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\queue.c" > CMakeFiles\freertos_kernel.dir\queue.c.i

src/CMakeFiles/freertos_kernel.dir/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/queue.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\queue.c" -o CMakeFiles\freertos_kernel.dir\queue.c.s

src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/stream_buffer.c
src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj -MF CMakeFiles\freertos_kernel.dir\stream_buffer.c.obj.d -o CMakeFiles\freertos_kernel.dir\stream_buffer.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\stream_buffer.c"

src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/stream_buffer.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\stream_buffer.c" > CMakeFiles\freertos_kernel.dir\stream_buffer.c.i

src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/stream_buffer.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\stream_buffer.c" -o CMakeFiles\freertos_kernel.dir\stream_buffer.c.s

src/CMakeFiles/freertos_kernel.dir/tasks.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/tasks.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/tasks.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/tasks.c
src/CMakeFiles/freertos_kernel.dir/tasks.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/CMakeFiles/freertos_kernel.dir/tasks.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/tasks.c.obj -MF CMakeFiles\freertos_kernel.dir\tasks.c.obj.d -o CMakeFiles\freertos_kernel.dir\tasks.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\tasks.c"

src/CMakeFiles/freertos_kernel.dir/tasks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/tasks.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\tasks.c" > CMakeFiles\freertos_kernel.dir\tasks.c.i

src/CMakeFiles/freertos_kernel.dir/tasks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/tasks.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\tasks.c" -o CMakeFiles\freertos_kernel.dir\tasks.c.s

src/CMakeFiles/freertos_kernel.dir/timers.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/timers.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/timers.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/timers.c
src/CMakeFiles/freertos_kernel.dir/timers.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/CMakeFiles/freertos_kernel.dir/timers.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/timers.c.obj -MF CMakeFiles\freertos_kernel.dir\timers.c.obj.d -o CMakeFiles\freertos_kernel.dir\timers.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\timers.c"

src/CMakeFiles/freertos_kernel.dir/timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/timers.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\timers.c" > CMakeFiles\freertos_kernel.dir\timers.c.i

src/CMakeFiles/freertos_kernel.dir/timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/timers.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\timers.c" -o CMakeFiles\freertos_kernel.dir\timers.c.s

src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj: src/CMakeFiles/freertos_kernel.dir/flags.make
src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj: src/CMakeFiles/freertos_kernel.dir/includes_C.rsp
src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj: S:/M.ScInformationTechnology-ES/Semester\ 1/05_RealTimeConceptsforEmbeddedSystems/Assignments/pcp/src/portable/MemMang/heap_5.c
src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj: src/CMakeFiles/freertos_kernel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj -MF CMakeFiles\freertos_kernel.dir\portable\MemMang\heap_5.c.obj.d -o CMakeFiles\freertos_kernel.dir\portable\MemMang\heap_5.c.obj -c "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\portable\MemMang\heap_5.c"

src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.i"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\portable\MemMang\heap_5.c" > CMakeFiles\freertos_kernel.dir\portable\MemMang\heap_5.c.i

src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.s"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && C:\msys64\mingw64\bin\cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src\portable\MemMang\heap_5.c" -o CMakeFiles\freertos_kernel.dir\portable\MemMang\heap_5.c.s

# Object files for target freertos_kernel
freertos_kernel_OBJECTS = \
"CMakeFiles/freertos_kernel.dir/croutine.c.obj" \
"CMakeFiles/freertos_kernel.dir/event_groups.c.obj" \
"CMakeFiles/freertos_kernel.dir/list.c.obj" \
"CMakeFiles/freertos_kernel.dir/queue.c.obj" \
"CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj" \
"CMakeFiles/freertos_kernel.dir/tasks.c.obj" \
"CMakeFiles/freertos_kernel.dir/timers.c.obj" \
"CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj"

# External object files for target freertos_kernel
freertos_kernel_EXTERNAL_OBJECTS =

src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/croutine.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/event_groups.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/list.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/queue.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/stream_buffer.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/tasks.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/timers.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/portable/MemMang/heap_5.c.obj
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/build.make
src/libfreertos_kernel.a: src/CMakeFiles/freertos_kernel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libfreertos_kernel.a"
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && $(CMAKE_COMMAND) -P CMakeFiles\freertos_kernel.dir\cmake_clean_target.cmake
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\freertos_kernel.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/freertos_kernel.dir/build: src/libfreertos_kernel.a
.PHONY : src/CMakeFiles/freertos_kernel.dir/build

src/CMakeFiles/freertos_kernel.dir/clean:
	cd /d "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" && $(CMAKE_COMMAND) -P CMakeFiles\freertos_kernel.dir\cmake_clean.cmake
.PHONY : src/CMakeFiles/freertos_kernel.dir/clean

src/CMakeFiles/freertos_kernel.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp" "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\src" "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build" "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src" "S:\M.ScInformationTechnology-ES\Semester 1\05_RealTimeConceptsforEmbeddedSystems\Assignments\pcp\build\src\CMakeFiles\freertos_kernel.dir\DependInfo.cmake" "--color=$(COLOR)"
.PHONY : src/CMakeFiles/freertos_kernel.dir/depend

