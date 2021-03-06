# This file is adapted from
# https://github.com/miloyip/rapidjson/blob/master/test/CMakeLists.txt

find_package(GTestSrc)

if(GTESTSRC_FOUND)
    enable_testing()

    if(WIN32 AND (NOT CYGWIN) AND (NOT MINGW))
        set(gtest_disable_pthreads ON)
        set(gtest_force_shared_crt ON)
    endif()

    add_subdirectory(${GTEST_SOURCE_DIR} ${CMAKE_BINARY_DIR}/googletest)
    include_directories(SYSTEM ${GTEST_INCLUDE_DIR})

    set(TEST_LIBRARIES gtest gtest_main)

    add_custom_target(tests ALL)
    # add_subdirectory(perftest)
    add_subdirectory(unittest)
endif()
