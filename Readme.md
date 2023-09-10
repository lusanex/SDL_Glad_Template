## SDL2_Glad_Template

### Overview

`SDL2_Glad_Template` is a foundational template designed to kickstart your graphics projects using SDL2 and Glad. SDL2 provides low-level access to audio, keyboard, mouse, joystick, and graphics hardware, while Glad is a loader generator for OpenGL, making it easier to handle OpenGL extensions and versions.

### Learn to Create This Template

If you're interested in learning how this template was created from scratch, check out the detailed guide at my [blog](https://blog.erichg.xyz/posts/post-3/).


### Features

- **SDL2 Integration**: Set up to harness the power of SDL2 for window creation, event handling, and more.
- **Glad for OpenGL**: Easily manage OpenGL extensions and versions with Glad.
- **Modular Structure**: Organized directory structure for easy management of headers, sources, and vendor libraries.
- **CMake Build System**: Cross-platform build system configuration using CMake, ensuring compatibility across different development environments.

### Getting Started

1. **Clone the Repository**:
```
git clone --recursive git@github.com:lusanex/SDL_Glad_Template.git
# Or use the following command if you forgot the --recursive flag:
git submodule update --init --recursive

```


2. **Navigate to the Directory**:
```
cd SDL2_Glad_Template
```

3. **Modify the Entry Point**:
```
Sources/main.cpp
```


4. **Build the Project**:
```
# The script does not install system-wide. All the binaries reside in the build/bin directory.
./install.sh

# To build the tests:
./install.sh --tests
```


5. **Run the project**:
```
# To test if everything is working:
./Build/bin/SdlOpengl

# To run the tests:
./Build-tests/bin/SdlTests

```





