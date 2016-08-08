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

if [[ -x `which astyle` ]]; then
  echo "Astyle detected. Formating source..." 1>&2
else
  die "Astyle NOT detected. Please install Astyle." 1>&2
fi

astyle --recursive --options=.astylerc *.cpp *.h
