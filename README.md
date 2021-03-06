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
* (optional) [Google Test](https://github.com/google/googletest) for unit and performance testing
* (optional) [Cppcheck](http://cppcheck.sourceforge.net/) for static analyzing
* (optional) [Valgrind](http://valgrind.org/) for dynamic analyzing
* (optional) [Doxygen](http://www.doxygen.org) for building documentation
* (optional) [Artistic Style](http://astyle.sourceforge.net/astyle.html) for formatting code

Building and Running Tests
-------------------------------

After installing prerequisites, just run:

```
./scripts/make.sh
./scripts/run_tests.sh
```

Generating Documentation
-------------------------------

After installing prerequisites, just run:

```
./scripts/gen_doc.sh
```

Note for Developers
-----------------------

Please run the following commands at the root of the project before committing:

```
./scripts/format.sh
./scripts/lint.sh
```

License
-----------------

MIT License, see LICENSE. Copyright (c) 2015-2016 Utensil Song (https://github.com/utensil)
