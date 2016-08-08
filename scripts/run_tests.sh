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

if [[ -x `which valgrind` ]]; then
  echo "Valgrind detected. Generating documentation..." 1>&2
else
  die "Valgrind NOT detected. Please install Valgrind." 1>&2
fi

cd build
ctest -V
bin/main
