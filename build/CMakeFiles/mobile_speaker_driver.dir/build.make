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
include CMakeFiles/mobile_speaker_driver.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mobile_speaker_driver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mobile_speaker_driver.dir/flags.make

CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o: CMakeFiles/mobile_speaker_driver.dir/flags.make
CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o: ../apps/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/apps/main.cpp

CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/apps/main.cpp > CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.i

CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/apps/main.cpp -o CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.s

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o: CMakeFiles/mobile_speaker_driver.dir/flags.make
CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o: ../src/AudioDriver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp > CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.i

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriver.cpp -o CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.s

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o: CMakeFiles/mobile_speaker_driver.dir/flags.make
CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o: ../src/AudioDriverLinux.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o -c /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp > CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.i

CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bezrazli4n0/projects/mobile-speaker-driver/src/AudioDriverLinux.cpp -o CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.s

# Object files for target mobile_speaker_driver
mobile_speaker_driver_OBJECTS = \
"CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o" \
"CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o" \
"CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o"

# External object files for target mobile_speaker_driver
mobile_speaker_driver_EXTERNAL_OBJECTS =

mobile_speaker_driver: CMakeFiles/mobile_speaker_driver.dir/apps/main.cpp.o
mobile_speaker_driver: CMakeFiles/mobile_speaker_driver.dir/src/AudioDriver.cpp.o
mobile_speaker_driver: CMakeFiles/mobile_speaker_driver.dir/src/AudioDriverLinux.cpp.o
mobile_speaker_driver: CMakeFiles/mobile_speaker_driver.dir/build.make
mobile_speaker_driver: CMakeFiles/mobile_speaker_driver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable mobile_speaker_driver"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mobile_speaker_driver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mobile_speaker_driver.dir/build: mobile_speaker_driver

.PHONY : CMakeFiles/mobile_speaker_driver.dir/build

CMakeFiles/mobile_speaker_driver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mobile_speaker_driver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mobile_speaker_driver.dir/clean

CMakeFiles/mobile_speaker_driver.dir/depend:
	cd /home/bezrazli4n0/projects/mobile-speaker-driver/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bezrazli4n0/projects/mobile-speaker-driver /home/bezrazli4n0/projects/mobile-speaker-driver /home/bezrazli4n0/projects/mobile-speaker-driver/build /home/bezrazli4n0/projects/mobile-speaker-driver/build /home/bezrazli4n0/projects/mobile-speaker-driver/build/CMakeFiles/mobile_speaker_driver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mobile_speaker_driver.dir/depend
