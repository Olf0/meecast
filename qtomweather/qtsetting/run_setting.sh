#!/bin/sh

make
export LD_LIBRARY_PATH=$PWD/../core:$LD_LIBRARY_PATH
./qtsetting
