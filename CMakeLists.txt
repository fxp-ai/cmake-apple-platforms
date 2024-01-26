cmake_minimum_required(VERSION 3.20)
project(MyFramework C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED TRUE)
set(CMAKE_C_EXTENSIONS TRUE)

add_library(${PROJECT_NAME} STATIC
    src/MyFramework.c)

# Specify public headers
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER src/MyFramework.h)

# Install the library
install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION lib
    PUBLIC_HEADER DESTINATION include/MyFramework)