#!/bin/bash
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SDL_RELEASE="release-2.28.3"
BUILD_TEST_DIR="Build-tests"
BUILD_DIR="Build"
SDL2_INCLUDES_PATH="${PROJECT_DIR}/Includes/SDL2"
SDL_DIR="${PROJECT_DIR}/Vendor/SDL"

function copy_sdl_include()
{
    if [[ ! -d "${SDL2_INCLUDES_PATH}" ]]; then
        mkdir "${SDL2_INCLUDES_PATH}"
    fi
    cd ${SDL_DIR}/include
    for file in *; do
        if [[ ! -L "${SDL2_INCLUDES_PATH}/$file" && ! -e "${SDL2_INCLUDES_PATH}/$file" ]]; then
            ln -s "$(pwd)/$file" "${SDL2_INCLUDES_PATH}"
        fi
    done
    exit 0
}


function delete_sdl_include()
{
    if [[ -d "${SDL2_INCLUDES_PATH}" ]]; then
        cd ${PROJECT_DIR}
        rm -rf "${SDL2_INCLUDES_PATH}"
    fi
    exit 0
}

function fetch_sdl()
{
    cd $SDL_DIR
    git checkout ${SDL_RELEASE}
    git fetch
    cd - > /dev/null
}

function clean_all()
{
    # Remove build directory if it exists
    if [[ -d "${BUILD_DIR}" ]]; then
        rm -rf ${BUILD_DIR} 
    fi
    # Remove build-tests directory if it exists
    if [[ -d "${BUILD_TEST_DIR}" ]]; then
        rm -rf ${BUILD_TEST_DIR} 
    fi
    delete_sdl_include
}

# Check for --tests flag
if [[ "$1" == "--tests" ]]; then
    # Create build-tests directory if it doesn't exist

    if [[ ! -d "${BUILD_TEST_DIR}" ]]; then
        mkdir ${BUILD_TEST_DIR}
    fi

    fetch_sdl
    # Change to build-tests directory
    cd ${BUILD_TEST_DIR} 

    # Run cmake with BUILD_TESTS flag
    cmake -DBUILD_TESTS=ON ..
    make
    copy_sdl_include

    exit 0

elif [[ "$1" == "--clean-all" ]]; then
    clean_all
    exit 0
  
else 
    if [[ ! -d "${BUILD_DIR}" ]]; then
        mkdir ${BUILD_DIR} 
    fi
    fetch_sdl
    cd ${BUILD_DIR} 
    cmake ..
    make
    copy_sdl_include
    exit 0

fi


