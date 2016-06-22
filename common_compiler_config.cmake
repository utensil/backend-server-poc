#
# Determine stdlib settings
#
set(stdlib_cxx "")
set(stdlib_common "")

macro(use_cxx11)
  if (CMAKE_VERSION VERSION_LESS "3.1")
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR ${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    endif ()
  else ()
    set (CMAKE_CXX_STANDARD 11)
  endif ()
endmacro(use_cxx11)
