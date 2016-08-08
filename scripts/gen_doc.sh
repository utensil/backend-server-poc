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

if [[ -x `which doxygen` ]]; then
  echo "Doxygen detected. Generating documentation..." 1>&2
else
  die "Doxygen NOT detected. Please install Doxygen." 1>&2
fi

# Init Doxyfile
# doxygen -g Doxyfile

# Update Doxyfile
# doxygen -u Doxyfile

# Generate Doxygen doc
doxygen Doxyfile
# Open doc/html/index.html to see the generated doc
# Open doc/xml/ to see the generated xml
