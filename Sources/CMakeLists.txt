set(BIN_MAIN "bin")

set(SOURCES 
    main.cpp)
set(CC "c++14")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -std=${CC}")

add_executable(${EXEC_MAIN} ${SOURCES})
target_include_directories(${EXEC_MAIN} PRIVATE ${HEADERS})
target_link_libraries(${EXEC_MAIN} SDL2main SDL2)
set_target_properties(${EXEC_MAIN} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BIN_MAIN})

