## ASA API Plugin Template (Linux & Wine)
This is a template for an [ASA API](https://github.com/ArkServerApi/AsaApi) plugin using MSVC inside of WINE(via [MSVC-WINE](https://github.com/mstorsjo/msvc-wine)) 
to cross-compile the plugin for the (required) microsoft-exclusive MSVC.

### How to Install

1) Install wine, python, msitools, and git packages. \
   On Ubuntu/Debian: \
   `sudo apt install wine python msitools git` \
   On Fedora: \
   `sudo dnf install wine python msitools git` \
   On Arch: \
   `sudo pacman -S wine python msitools git`


2) Download MSVC & Windows SDK: \
    ```
    git clone https://github.com/mstorsjo/msvc-wine ~/Documents/msvc-wine
    cd ~/Documents/msvc-wine
    ./vsdownload.py --accept-license -dest ~/msvc
    ./install.sh ~/msvc
    ```

3)
    Download the latest `AsaApi` release as a .ZIP file [here](https://github.com/ArkServerApi/AsaApi/releases). \
    Copy the 'AsaApi.lib' file within that downloaded `AsaApi` ZIP's 'Lib' folder(extract the .ZIP). \
    Paste that `AsaApi.lib` file into this repo's `/extern/` folder.
4) Open this project's folder with JetBrains CLion(or your preferred IDE) and build using CMake.

### Tips
 1) Like with any CMake project, you'll need to add each .CPP and .H file you create to the `CMakeLists.txt` `add_library(TemplatePlugin SHARED src/main.cpp)` line.
    Example:
    ```cmake
    add_library(TemplatePlugin SHARED
        src/main.cpp
        src/main.h
        src/helper.cpp
        src/skeleton.cpp)
    ```
 2) This project *should* also build fine on actual Windows systems, however I have not tested that. Please submit a GitHub issue and/or PR if you have \
    any problems.