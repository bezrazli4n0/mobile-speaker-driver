# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bezrazli4n0/projects/mobile-speaker-driver

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bezrazli4n0/projects/mobile-speaker-driver/build

# Include any dependencies generated for this target.
include src/CMakeFiles/mobile_speaker_driver_run.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/mobile_speaker_driver_run.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o: src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make
src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o: ../src/AudioDriver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.i"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp > CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.i

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.s"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.s

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o: src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make
src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o: ../src/AudioDriverLinux.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.i"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp > CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.i

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.s"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.s

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o: src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make
src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o: ../src/AudioDriverLinuxTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinuxTest.cpp

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.i"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinuxTest.cpp > CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.i

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.s"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinuxTest.cpp -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.s

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o: src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make
src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o: ../src/AudioDriverWindows.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindows.cpp

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.i"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindows.cpp > CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.i

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.s"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindows.cpp -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.s

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o: src/CMakeFiles/mobile_speaker_driver_run.dir/flags.make
src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o: ../src/AudioDriverWindowsTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindowsTest.cpp

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.i"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindowsTest.cpp > CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.i

src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.s"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverWindowsTest.cpp -o CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.s

# Object files for target mobile_speaker_driver_run
mobile_speaker_driver_run_OBJECTS = \
"CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o" \
"CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o" \
"CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o" \
"CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o" \
"CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o"

# External object files for target mobile_speaker_driver_run
mobile_speaker_driver_run_EXTERNAL_OBJECTS =

src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriver.cpp.o
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinux.cpp.o
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverLinuxTest.cpp.o
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindows.cpp.o
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/AudioDriverWindowsTest.cpp.o
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/build.make
src/mobile_speaker_driver_run: src/CMakeFiles/mobile_speaker_driver_run.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable mobile_speaker_driver_run"
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mobile_speaker_driver_run.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/mobile_speaker_driver_run.dir/build: src/mobile_speaker_driver_run

.PHONY : src/CMakeFiles/mobile_speaker_driver_run.dir/build

src/CMakeFiles/mobile_speaker_driver_run.dir/clean:
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build/src && $(CMAKE_COMMAND) -P CMakeFiles/mobile_speaker_driver_run.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/mobile_speaker_driver_run.dir/clean

src/CMakeFiles/mobile_speaker_driver_run.dir/depend:
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bezrazli4n0/projects/mobile-speaker-driver /home/bezrazli4n0/projects/mobile-speaker-driver/src /home/bezrazli4n0/projects/mobile-speaker-driver/build /home/bezrazli4n0/projects/mobile-speaker-driver/build/src /home/bezrazli4n0/projects/mobile-speaker-driver/build/src/CMakeFiles/mobile_speaker_driver_run.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/mobile_speaker_driver_run.dir/depend

