# Set variable to project name
set(TESTBINARY ${PROJECT_NAME}_test)

# Include googletest
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/googletest" "extern/googletest")

# Add all source files to variable
file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true ${PROJECT_SOURCE_DIR}/src/*.cpp)

add_executable(${TESTBINARY} main.cpp AudioDriverTest.cpp ${SOURCES})

# Link googletest libs
target_link_libraries(${TESTBINARY} gtest gtest_main)