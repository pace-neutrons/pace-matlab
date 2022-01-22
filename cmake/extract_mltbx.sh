#!/bin/bash

if [ ! -d $2 ]
then
    mkdir "$2"
fi

unzip "$1" fsroot/* -d $2 && rm -f $2/fsroot/create_mltbx.m && mv -f $2/fsroot/* $2 && rm -r $2/fsroot

exit 0
