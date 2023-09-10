cmake_minimum_required(VERSION 3.10)
project(SDL_Glad_Template)

set(CC "c++14")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -std=${CC}")

set(EXEC_TESTS "SdlTests")
set(EXEC_MAIN "SdlOpengl")



set(VENDOR_SOURCE_SDL ${CMAKE_SOURCE_DIR}/Vendor/SDL)
set(VENDOR_SOURCE_GOOGLETEST ${CMAKE_SOURCE_DIR}/Vendor/googletest)
set(VENDOR_SOURCE_GLAD ${CMAKE_SOURCE_DIR}/Vendor/glad)
set(PROJECT_SOURCES ${CMAKE_SOURCE_DIR}/Sources)
set(PROJECT_TESTS ${CMAKE_SOURCE_DIR}/Tests)

set(HEADERS 
    ${CMAKE_SOURCE_DIR}/Includes
    ${CMAKE_SOURCE_DIR}/Includes/SDL2
    ${VENDOR_SOURCE_GLAD}/include
)

option(SDL_DISABLE_INSTALL  ON)
option(SDL_DISABLE_INSTALL_DOCS ON)
option(SDL_DISABLE_UNINSTALL ON)
option(SDL_DISABLE_INSTALL_CPACK ON)
option(SDL_TEST_LIBRARY OFF)
add_subdirectory(${VENDOR_SOURCE_SDL})

option(BUILD_TESTS "Build the tests" OFF)

if(BUILD_TESTS)
    option(INSTALL_GTEST OFF)
    add_subdirectory(${VENDOR_SOURCE_GOOGLETEST})
    add_subdirectory(${PROJECT_TESTS})
else()
    add_subdirectory(${PROJECT_SOURCES})
endif()

