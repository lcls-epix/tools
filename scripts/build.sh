#!/bin/bash
#
BUILD32=true

function make_link()
{
  if [ ! -e $1/$2 ]; then
    ln -s $2-opt $1/$2
  fi
}

for i in "$@"
do
if [[ "$i" == "--no32" ]] ; then
  BUILD32=false
fi
done

if [[ "$BUILD32" == true ]] ; then
  make i386-linux-opt
  make i386-linux-dbg
fi

x86_64_arch='unknown'
if [[ `uname -r` == *el5* ]]; then
  x86_64_arch='x86_64-linux'
elif [[ `uname -r` == *el6* ]]; then
  x86_64_arch='x86_64-rhel6'
elif [[ `uname -r` == *el7* ]]; then
  x86_64_arch='x86_64-rhel7'
fi

make ${x86_64_arch}-opt
make ${x86_64_arch}-dbg

make_link build/pds/lib ${x86_64_arch}
make_link build/pdsdata/lib ${x86_64_arch}
make_link build/pdsapp/lib ${x86_64_arch}
make_link build/pdsapp/bin ${x86_64_arch}

