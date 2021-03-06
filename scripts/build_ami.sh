#!/bin/bash
#
#
function make_link()
{
  if [ -e $1/x86_64-linux-opt ]; then
    if [ ! -e $1/x86_64-linux ]; then
      ln -s x86_64-linux-opt $1/x86_64-linux
    fi
  fi
  if [ -e $1/x86_64-rhel6-opt ]; then
    if [ ! -e $1/x86_64-rhel6 ]; then
      ln -s x86_64-rhel6-opt $1/x86_64-rhel6
    fi
  fi
  if [ -e $1/x86_64-rhel7-opt ]; then
    if [ ! -e $1/x86_64-rhel7 ]; then
      ln -s x86_64-rhel7-opt $1/x86_64-rhel7
    fi
  fi
}

make x86_64-linux-opt
make x86_64-linux-dbg
make x86_64-rhel6-opt
make x86_64-rhel6-dbg
make x86_64-rhel7-opt
make x86_64-rhel7-dbg

make_link build/ami/lib

