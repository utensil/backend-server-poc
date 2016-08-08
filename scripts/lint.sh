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

if [[ -x `which KWStyle` ]]; then
  echo "KWStyle detected. Checking..." 1>&2
else
  echo "NOTE: KWStyle NOT detected. Installing..." 1>&2
  bash scripts/install_kwstyle.sh || die "Install KWStyle failed"
fi

echo {include,src,test}/{**/,}*.{c,cpp,h}|xargs -n 1|grep -v -F '*' > .sourcefiles
# echo {include,src,test}|xargs -n 1|grep -v -F '*' > .sourcedirs

KWStyle -D .sourcefiles -R -v -vim

echo "Check finished." 1>&2
