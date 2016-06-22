# NOTE: Run this script from the root of the project

# Exit if any statement returns a non-true value
set -o errexit
# Print command traces before executing command.
# set -o xtrace

mkdir build >/dev/null 2>&1 || true
cd build
cmake -G "Unix Makefiles" ..
make
cd bin
./main
