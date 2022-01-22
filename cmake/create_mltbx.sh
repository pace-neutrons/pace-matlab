#!/bin/bash

if [ ! -d $2 ]
then
    mkdir "$2"
fi

version=0.1.0
sed s/TO_BE_REPLACED/$version/ $1 > $2/pace.prj

cat << EOF > $2/create_mltbx.m
matlab.addons.toolbox.packageToolbox("pace.prj", "pace.mltbx");
EOF
