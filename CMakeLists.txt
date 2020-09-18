# Setup cmake minimal required version
cmake_minimum_required(VERSION 3.10)

# Declare project
project(mobile_speaker_driver)

# Change c++ standard
set(CMAKE_CXX_STANDARD 17)

# Include googletest directory
include_directories(src extern/googletest/googletest/include)

# Adding subdirs to project
add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(extern/googletest)

# Add source files to driver library
if (WIN32)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverWindows.cpp)
elseif (UNIX)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverLinux.cpp)
endif (WIN32)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})