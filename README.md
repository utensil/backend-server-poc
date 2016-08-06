Backend Server POC
======================

Proof of concepts for C/C++ backend server architectures.

Platforms
-------------------------------

Supports only *nix-like operating systems and C++11 compliant compilers:

* Linux (gcc 4.8.1+, clang 3.5+)
* Mac OSX (clang 3.5+)

Prerequisites
-------------------------------

* [CMake](https://cmake.org/) for building
* (optional) [Doxygen](http://www.doxygen.org) for building documentation
* (optional) [Google Test](https://github.com/google/googletest) for unit and performance testing
* (optional) [Cppcheck](http://cppcheck.sourceforge.net/) for static analyzing
* (optional) [Valgrind](http://valgrind.org/) for dynamic analyzing

Building and Running Tests
-------------------------------

After installing prerequisites, just run:

```
# For using bundled Google Test in directory thirdparty
git submodule update --init
mkdir build
cd build
cmake ..
make -j4
ctest -V
```

License
-----------------

MIT License, see LICENSE. Copyright (c) 2015-2016 Utensil Song (https://github.com/utensil)
