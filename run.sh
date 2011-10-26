#!/bin/sh
/usr/bin/gcc-4.2 -framework Foundation hello.m -o hello
if [  "$?" == "0" ]; then
    ./hello
fi
