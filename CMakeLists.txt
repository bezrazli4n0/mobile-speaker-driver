# Setup cmake minimal required version
cmake_minimum_required(VERSION 3.10)

# Declare project
project(mobile_speaker_driver)

# Adding googletest to project
option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()

# Change c++ standard
set(CMAKE_CXX_STANDARD 17)

# Add source files to driver library
if (WIN32)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverWindows.cpp)
elseif (UNIX)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverLinux.cpp)
endif (WIN32)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})