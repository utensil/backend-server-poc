cmake_minimum_required(VERSION 2.8.11)
project (backend-server-poc CXX)

set(CMAKE_BUILD_TYPE Release)
set(CMAKE_VERBOSE_MAKEFILE OFF)

include(common_compiler_config.cmake)

use_cxx11()

include_directories(include)
add_subdirectory(src bin)
