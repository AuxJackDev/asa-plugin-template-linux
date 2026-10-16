set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR AMD64)

set(MSVC_BIN "$ENV{HOME}/msvc17/bin/x64")

set(CMAKE_C_COMPILER   "${MSVC_BIN}/cl")
set(CMAKE_CXX_COMPILER "${MSVC_BIN}/cl")
set(CMAKE_LINKER       "${MSVC_BIN}/link")
set(CMAKE_AR           "${MSVC_BIN}/lib")
set(CMAKE_RC_COMPILER  "${MSVC_BIN}/rc")
set(CMAKE_MT           "${MSVC_BIN}/mt")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Avoid MS-PDB server problems under Wine by embedding debug info
set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT Embedded)