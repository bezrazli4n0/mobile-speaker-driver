# Set variable to project name
set(TESTBINARY ${PROJECT_NAME}_test)

# Include googletest
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/googletest" "extern/googletest")

# Add all source files to variable
file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true ${PROJECT_SOURCE_DIR}/src/*.cpp)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(${TESTBINARY} main.cpp AudioDriverTest.cpp ${SOURCES})

# Link googletest libs
target_link_libraries(${TESTBINARY} gtest gtest_main)

# Links alsa library
if (UNIX)
    target_link_libraries(${TESTBINARY} asound)
endif (UNIX)