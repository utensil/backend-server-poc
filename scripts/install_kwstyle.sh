#!/usr/bin/env bash

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

mkdir thirdparty 2>/dev/null
cd thirdparty
rm -rf KWStyle
git clone --depth=1 https://github.com/utensil-contrib/KWStyle.git
cd KWStyle
mkdir build
cd build
cmake ..
make -j4
make install
cd ../../../
