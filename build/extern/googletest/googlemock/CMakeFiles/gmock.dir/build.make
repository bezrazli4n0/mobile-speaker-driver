# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:/Projects/mobile-speaker-driver

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:/Projects/mobile-speaker-driver/build

# Include any dependencies generated for this target.
include extern/googletest/googlemock/CMakeFiles/gmock.dir/depend.make

# Include the progress variables for this target.
include extern/googletest/googlemock/CMakeFiles/gmock.dir/progress.make

# Include the compile flags for this target's objects.
include extern/googletest/googlemock/CMakeFiles/gmock.dir/flags.make

extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.obj: extern/googletest/googlemock/CMakeFiles/gmock.dir/flags.make
extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.obj: extern/googletest/googlemock/CMakeFiles/gmock.dir/includes_CXX.rsp
extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.obj: ../extern/googletest/googlemock/src/gmock-all.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:/Projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.obj"
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && C:/TDM-GCC-32/bin/c++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gmock.dir/src/gmock-all.cc.obj -c D:/Projects/mobile-speaker-driver/extern/googletest/googlemock/src/gmock-all.cc

extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gmock.dir/src/gmock-all.cc.i"
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && C:/TDM-GCC-32/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:/Projects/mobile-speaker-driver/extern/googletest/googlemock/src/gmock-all.cc > CMakeFiles/gmock.dir/src/gmock-all.cc.i

extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gmock.dir/src/gmock-all.cc.s"
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && C:/TDM-GCC-32/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:/Projects/mobile-speaker-driver/extern/googletest/googlemock/src/gmock-all.cc -o CMakeFiles/gmock.dir/src/gmock-all.cc.s

# Object files for target gmock
gmock_OBJECTS = \
"CMakeFiles/gmock.dir/src/gmock-all.cc.obj"

# External object files for target gmock
gmock_EXTERNAL_OBJECTS =

lib/libgmock.a: extern/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.obj
lib/libgmock.a: extern/googletest/googlemock/CMakeFiles/gmock.dir/build.make
lib/libgmock.a: extern/googletest/googlemock/CMakeFiles/gmock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:/Projects/mobile-speaker-driver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../lib/libgmock.a"
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean_target.cmake
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gmock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
extern/googletest/googlemock/CMakeFiles/gmock.dir/build: lib/libgmock.a

.PHONY : extern/googletest/googlemock/CMakeFiles/gmock.dir/build

extern/googletest/googlemock/CMakeFiles/gmock.dir/clean:
	cd D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean.cmake
.PHONY : extern/googletest/googlemock/CMakeFiles/gmock.dir/clean

extern/googletest/googlemock/CMakeFiles/gmock.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" D:/Projects/mobile-speaker-driver D:/Projects/mobile-speaker-driver/extern/googletest/googlemock D:/Projects/mobile-speaker-driver/build D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock D:/Projects/mobile-speaker-driver/build/extern/googletest/googlemock/CMakeFiles/gmock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : extern/googletest/googlemock/CMakeFiles/gmock.dir/depend

