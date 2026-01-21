# CMake toolchain file for x86 (32-bit) builds
# Cross-platform: works on Windows, Linux, and macOS

# Platform-specific configuration
if(WIN32)
  # On Windows with MSVC, the architecture is set by CMakePresets.json
  # Don't interfere with compiler detection - let CMake detect MSVC naturally
  # Visual Studio and Ninja will use the environment provided by the developer command prompt
  set(CMAKE_SYSTEM_NAME Windows)
  set(CMAKE_SYSTEM_PROCESSOR X86)
  # CMAKE_SIZEOF_VOID_P will be set automatically by CMake based on the architecture
  # specified in the preset (architecture: { value: "x86", strategy: "external" })
  message(STATUS "x86 Toolchain: Configured for 32-bit Windows build")

elseif(UNIX AND NOT APPLE)
  # On Linux, add -m32 flag to force 32-bit compilation
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32" CACHE STRING "C compiler flags" FORCE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32" CACHE STRING "C++ compiler flags" FORCE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32" CACHE STRING "Linker flags" FORCE)
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -m32" CACHE STRING "Shared linker flags" FORCE)
  set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -m32" CACHE STRING "Module linker flags" FORCE)
  message(STATUS "x86 Toolchain: Configured for 32-bit Linux build")

elseif(APPLE)
  # On macOS, add -m32 flag (note: 32-bit support removed in macOS 10.15+)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32" CACHE STRING "C compiler flags" FORCE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32" CACHE STRING "C++ compiler flags" FORCE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32" CACHE STRING "Linker flags" FORCE)
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -m32" CACHE STRING "Shared linker flags" FORCE)
  set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -m32" CACHE STRING "Module linker flags" FORCE)
  message(STATUS "x86 Toolchain: Configured for 32-bit macOS build (requires 32-bit libraries)")
endif()
