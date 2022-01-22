#!/bin/bash

if [ ! -d $2 ]
then
    mkdir "$2"
fi

if [ ! -d "$2/+pace" ]
then
    mkdir "$2/+pace"
fi

hpath="fullfile(fileparts(mfilename('fullpath')), '\1')"
sed s/''"'"'${\([Ha-z]*\).*}'"'"''/"$hpath"/ "$1/horace_on.m.template" > "$2/horace_on.m"
sed s/''"'"'${\([Ha-z]*\).*}'"'"''/"$hpath"/ "$1/herbert_on.m.template" > "$2/herbert_on.m"
cp "$1/worker_v2.m.template" "$2/worker_v2.m"

exit 0
