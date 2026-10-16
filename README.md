## ASA API Plugin Template (Linux & Wine)
This is a template for an [ASA API](https://github.com/ArkServerApi/AsaApi) plugin using MSVC inside of WINE to build.

### How to Install

1) Install wine, python, msitools, and git packages. \
   On Ubuntu/Debian: \
   `sudo apt install wine python msitools git` \
   On Fedora: \
   `sudo dnf install wine python msitools git` \
   On Arch: \
   `sudo pacman -S wine python msitools git`

3) Download MSVC using the MSVC-Wine git repo:
    ```
    git clone https://github.com/mstorsjo/msvc-wine ~/Repos/msvc-wine
    cd msvc-wine
    ./vsdownload.py --accept-license --major 17 --dest ~/msvc17
    ./install.sh ~/msvc17
    ```

4)
    Download the latest AsaApi release as a .ZIP file [here](https://github.com/ArkServerApi/AsaApi/releases). \
    Copy the 'AsaApi.lib' file within that downloaded ZIP's 'Lib' folder(extract the .ZIP). \
    Paste that `AsaApi.lib` file into this repo's `/extern/` folder.
5) Open this project's folder with JetBrains CLion(or your preferred IDE) and build using CMake.
