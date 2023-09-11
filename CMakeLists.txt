cmake_minimum_required(VERSION 3.10)
#project name
project(SDL_Glad_Template)

#compiler options
set(CC "c++14")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -std=${CC}")

#execuatable names 
set(EXEC_TESTS "SdlTests")
set(EXEC_MAIN "SdlOpengl")

#variables to the different projects
set(VENDOR_SOURCE_SDL ${CMAKE_SOURCE_DIR}/Vendor/SDL)
set(VENDOR_SOURCE_GOOGLETEST ${CMAKE_SOURCE_DIR}/Vendor/googletest)
set(VENDOR_SOURCE_GLAD ${CMAKE_SOURCE_DIR}/Vendor/glad)
set(PROJECT_SOURCES ${CMAKE_SOURCE_DIR}/Sources)
set(PROJECT_TESTS ${CMAKE_SOURCE_DIR}/Tests)

#headers to the libraries we are using and our own include folder
set(HEADERS 
    ${CMAKE_SOURCE_DIR}/Includes
    ${CMAKE_SOURCE_DIR}/Includes/SDL2
    ${VENDOR_SOURCE_GLAD}/include
)

#Turn off some SDL options
option(SDL_DISABLE_INSTALL  ON)
option(SDL_DISABLE_INSTALL_DOCS ON)
option(SDL_DISABLE_UNINSTALL ON)
option(SDL_DISABLE_INSTALL_CPACK ON)
option(SDL_TEST_LIBRARY OFF)
add_subdirectory(${VENDOR_SOURCE_SDL})

#boolean variable to tell to this cmake file to build or not the 
#tests.
option(BUILD_TESTS "Build the tests" OFF)

if(BUILD_TESTS)
    option(INSTALL_GTEST OFF)
    add_subdirectory(${VENDOR_SOURCE_GOOGLETEST})
    add_subdirectory(${PROJECT_TESTS})
else()
    #project build
    add_subdirectory(${PROJECT_SOURCES})
endif()

