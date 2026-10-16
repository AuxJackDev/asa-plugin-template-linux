## ASA API Plugin Template (Linux & Wine)
This is a template for an [ASA API](https://github.com/ArkServerApi/AsaApi) plugin using MSVC inside of WINE to build.

### How to Install
The commands in this guide assume you are using Arch Linux.

1) Install wine, python, msitools, and git: \
    `sudo pacman -S wine python msitools git`

2) Download MSVC & Windows SDK: \
    ```
    git clone https://github.com/mstorsjo/msvc-wine ~/Repos/msvc-wine
    cd msvc-wine
    ./vsdownload.py --accept-license --major 17 --dest ~/msvc17
    ./install.sh ~/msvc17
    ```

3)
    Download the latest AsaApi release as a .ZIP file [here](https://github.com/ArkServerApi/AsaApi/releases). \
    Copy the 'AsaApi.lib' file within that downloaded ZIP's 'Lib' folder(extract the .ZIP). \
    Paste that `AsaApi.lib` file into this repo's `/extern/` folder.
4) Open this project's folder with JetBrains CLion(or your preferred IDE) and build using CMake.