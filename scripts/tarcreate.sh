#!/bin/bash
#

set -u
set -e

# require one parameter and no flags
if [[ $# -ne 1 || ${1:0:1} == '-' ]]; then
  echo "Usage: $0 <outfile>"
  exit 1
fi

if [[ ! -d build ]] || [[ ! -d tools ]]; then
  echo "Please cd to the directory above build and tools before running this script"
  exit 1
fi

# copy the header files
/bin/mkdir -pv build/timetool/service
/bin/cp -pv timetool/service/*.hh build/timetool/service

# set file and dir permissions
/usr/bin/find build \( -type f -o -type d \) -exec /bin/chmod 755 {} \;
/usr/bin/find tools \( -type f -o -type d \) -exec /bin/chmod 755 {} \;

# create the tar file
/bin/tar czvf $1 --exclude=.svn --exclude=dep --exclude=obj --exclude=.buildbot-sourcedata build tools

