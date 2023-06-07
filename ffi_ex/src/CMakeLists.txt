# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ffi_ex_library VERSION 0.0.1 LANGUAGES C)

add_library(ffi_ex SHARED
        duktape.c
        )
set_target_properties(ffi_ex PROPERTIES
        PUBLIC_HEADER duktape.h       # Modify
        PRIVATE_HEADER duk_config.h   # Add
        OUTPUT_NAME "ffi_ex"      # Add
        )

# Add from here...
if (WIN32)
    set_target_properties(ffi_ex PROPERTIES
            WINDOWS_EXPORT_ALL_SYMBOLS ON
            )
endif (WIN32)

target_compile_definitions(ffi_ex PUBLIC DART_SHARED_LIB)
