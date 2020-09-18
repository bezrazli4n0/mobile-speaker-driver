set(BINARY ${CMAKE_PROJECT_NAME}_test)

# Add array of files in variable
file(GLOB_RECURSE TEST_SOURCES LIST_DIRECTORIES false *.h *.cpp)

# Add array of src files in var
file(GLOB_RECURSE TEST_SRC_SOURCES LIST_DIRECTORIES false ../src/*.h ../src/*.cpp)

# Declare new variables
set(SOURCES ${TEST_SOURCES})

set(SRC_SOURCES ${TEST_SRC_SOURCES})

# Create test executable
add_executable(${BINARY} ${TEST_SOURCES} ${TEST_SRC_SOURCES})

add_test(NAME ${BINARY} COMMAND ${BINARY})

target_link_libraries(${BINARY} PUBLIC gtest)