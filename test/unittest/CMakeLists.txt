# This file is adapted from
# https://github.com/miloyip/rapidjson/blob/master/test/unittest/CMakeLists.txt

set(lib_static_bes bes)
list(APPEND TEST_LIBRARIES ${lib_static_bes})

set(unittest_sources
  unittest.cpp
  test_dummy.cpp
)

include(CheckCXXCompilerFlag)

set(CXX_WARNING_SUPPRESS_FLAG "-Wno-global-constructors -Wno-c++98-compat -Wno-c++98-compat-pedantic")

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wall -Wextra -Weffc++ -Wswitch-default -Wfloat-equal ${CXX_WARNING_SUPPRESS_FLAG}")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wall -Wextra -Weffc++ -Wswitch-default -Wfloat-equal -Wimplicit-fallthrough -Weverything ${CXX_WARNING_SUPPRESS_FLAG}")
  # If the user is running a newer version of Clang that includes the
  # -Wdouble-promotion, we will ignore that warning.
  if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 3.7)
    CHECK_CXX_COMPILER_FLAG("-Wno-double-promotion" HAS_NO_DOUBLE_PROMOTION)
    if (HAS_NO_DOUBLE_PROMOTION)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-double-promotion")
    endif()
  endif()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  # Force to always compile with /W4
  if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
    string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
  endif()

  # Force to always compile with /WX
  if(CMAKE_CXX_FLAGS MATCHES "/WX-")
    string(REGEX REPLACE "/WX-" "/WX" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /WX")
  endif()
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

add_executable(unittest ${unittest_sources})
target_link_libraries(unittest ${TEST_LIBRARIES})

add_dependencies(tests unittest)

add_test(NAME unittest
  COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/unittest
  WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

message(STATUS "unittest in located at
${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/unittest")

if(NOT MSVC)
    add_test(NAME valgrind_unittest
        COMMAND valgrind ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/unittest --gtest_filter=-TODO.*
        # For .valgrindrc
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
endif(NOT MSVC)
