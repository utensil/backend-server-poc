set(bes_sources dummy/dummy.cpp)

set(lib_static_bes bes)
add_library(${lib_static_bes} STATIC ${bes_sources})

set(executable_main main)
add_executable(${executable_main} main.cpp)
target_link_libraries(${executable_main} ${lib_static_bes})
