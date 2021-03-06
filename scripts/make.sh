#!/usr/bin/env bash

# Exit if any statement returns a non-true value
set -o errexit
# Print command traces before executing command.
# set -o xtrace

die()
{
  echo "ERROR: $@" 1>&2
  exit 1
}

# NOTE: Run this script from the root of the project
scripts_dir=$(dirname $0) # => scripts
working_dir=$(basename `pwd`) # => backend-server-poc
if [[ $working_dir != 'backend-server-poc' ]]; then
  die "You must run this script from the root of the project"
fi

# For using bundled Google Test in directory thirdparty
git submodule update --init || die "git submodule update --init failed."

mkdir build >/dev/null 2>&1 || true
cd build
cmake -G "Unix Makefiles" ..
make -j4
