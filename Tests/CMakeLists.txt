#Output to 
set(BIN_TESTS "bin")
#Grep all the files in the current dir and set them into TEST_SOURCES
#variable
file(GLOB TEST_SOURCES "*.cpp")

#message("EXEC_TESTS: ${EXEC_TESTS}")
#message("VENDOR_SOURCE_GOOGLETEST: ${VENDOR_SOURCE_GOOGLETEST}")
#message("HEADERS: ${HEADERS}")

#Adding sources to the exec
add_executable(${EXEC_TESTS} ${TEST_SOURCES})

#targeting the headers to the exec
target_include_directories(${EXEC_TESTS} PRIVATE   ${VENDOR_SOURCE_GOOGLETEST}
    ${HEADERS}
    )
#linking the libraries to the final output exec
target_link_libraries(${EXEC_TESTS} SDL2main SDL2 gtest gtest_main)

#Copying the binarie to the bin folder inside Build folder
set_target_properties(${EXEC_TESTS} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BIN_TESTS})
