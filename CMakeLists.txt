cmake_minimum_required(VERSION 4.3)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(TemplatePlugin CXX)
add_library(TemplatePlugin SHARED main.cpp main.h)


add_library(AsaApi INTERFACE)
target_compile_definitions(AsaApi INTERFACE UNICODE _UNICODE)
target_compile_definitions(TemplatePlugin PRIVATE
        _CRT_SECURE_NO_WARNINGS
        WIN32_LEAN_AND_MEAN
        NOMINMAX
)
if(MSVC)
    target_compile_options(TemplatePlugin PRIVATE /utf-8 /EHsc)
endif()

target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/API/UE/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi/AsaApi/Core/Public/API/UE/Windows/")
target_include_directories(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/fmt/include/")
target_link_libraries(AsaApi INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/extern/AsaApi.lib")

target_link_libraries(TemplatePlugin PRIVATE AsaApi)
