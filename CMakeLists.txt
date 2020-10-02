# Setup cmake minimal required version
cmake_minimum_required(VERSION 3.0)

# Declare project
project(mobile_speaker_driver)

# Adding googletest to project
option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()

# Include cxxopts
add_subdirectory(extern/cxxopts)
include_directories(extern/cxxopts/include)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add source files to driver library
if (WIN32)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverWindows.cpp src/WifiConnector.cpp)
    ADD_DEFINITIONS(-DUNICODE -D_UNICODE)
elseif (UNIX)
    set(SOURCE_FILES apps/main.cpp src/AudioDriver.cpp src/AudioDriverLinux.cpp src/WifiConnector.cpp)
endif (WIN32)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Link alsa library
if (UNIX)
    target_link_libraries(${PROJECT_NAME} asound)
endif (UNIX)