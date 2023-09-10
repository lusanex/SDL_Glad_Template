set(BIN_TESTS "bin")
file(GLOB TEST_SOURCES "*.cpp")

message("EXEC_TESTS: ${EXEC_TESTS}")
message("VENDOR_SOURCE_GOOGLETEST: ${VENDOR_SOURCE_GOOGLETEST}")
message("HEADERS: ${HEADERS}")

add_executable(${EXEC_TESTS} ${TEST_SOURCES})

target_include_directories(${EXEC_TESTS} PRIVATE   ${VENDOR_SOURCE_GOOGLETEST}
    ${HEADERS}
    )
target_link_libraries(${EXEC_TESTS} SDL2main SDL2 gtest gtest_main)

set_target_properties(${EXEC_TESTS} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BIN_TESTS})
