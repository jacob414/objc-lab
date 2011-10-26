#!/bin/sh
if [ "$1" == "" ]; then
    echo "Usage: run.sh <name of example program>"
    exit 1
fi

/usr/bin/gcc-4.2 -framework Foundation $1.m -o $1.app
if [  "$?" == "0" ]; then
    ./$1.app
fi
