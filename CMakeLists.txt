cmake_minimum_required(VERSION 4.3)

if(CMAKE_HOST_UNIX)
    if(NOT DEFINED ENV{MSVC_PATH})
        message(FATAL_ERROR "MSVC_PATH not set (e.g. $HOME/msvc/bin/x64). Please use the 'linux-wine' CMake profile!")
    endif()

    set(CMAKE_SYSTEM_NAME Windows)
    set(CMAKE_C_COMPILER $ENV{MSVC_PATH}/cl)
    set(CMAKE_CXX_COMPILER $ENV{MSVC_PATH}/cl)
    set(CMAKE_LINKER $ENV{MSVC_PATH}/link)
    set(CMAKE_RC_COMPILER $ENV{MSVC_PATH}/rc)
    set(CMAKE_MT $ENV{MSVC_PATH}/mt)
endif()

project(TemplatePlugin VERSION 1.0.0 LANGUAGES CXX)
set(BUILD_SHARED_LIBS ON)

# Configure C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(TemplatePlugin SHARED src/main.cpp)
add_library(AsaApi INTERFACE)
target_compile_definitions(AsaApi INTERFACE UNICODE _UNICODE)
target_compile_definitions(TemplatePlugin PRIVATE
        NOMINMAX
)
target_compile_options(TemplatePlugin PRIVATE /utf-8 /EHsc)

set_target_properties(TemplatePlugin PROPERTIES
        WINDOWS_EXPORT_ALL_SYMBOLS ON
)

target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/API/UE/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/API/UE/Windows/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/fmt/include/")
target_link_libraries(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi.lib")

target_link_libraries(TemplatePlugin PRIVATE AsaApi)

if(CMAKE_HOST_UNIX)
    # msvc-wine sets INCLUDE only inside its cl wrapper; expose STL/SDK headers so IDE can resolve them
    get_filename_component(MSVC_ROOT "$ENV{MSVC_PATH}/../.." ABSOLUTE)
    file(GLOB MSVC_STL_INCLUDE "${MSVC_ROOT}/vc/tools/msvc/*/include")
    file(GLOB WINSDK_INCLUDE "${MSVC_ROOT}/kits/10/include/*")
    list(GET WINSDK_INCLUDE -1 WINSDK_INCLUDE)
    target_include_directories(TemplatePlugin SYSTEM PRIVATE
            ${MSVC_STL_INCLUDE}
            ${WINSDK_INCLUDE}/ucrt
            ${WINSDK_INCLUDE}/um
            ${WINSDK_INCLUDE}/shared
            ${WINSDK_INCLUDE}/winrt
    )
endif()