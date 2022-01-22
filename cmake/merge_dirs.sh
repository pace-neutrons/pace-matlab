#!/bin/bash

# Merges the contents of folder $2 into folder $1
d1=$(echo "$1" | sed "s/\//\\\\\//g")
d2=$(echo "$2" | sed "s/\//\\\\\//g")
for ff in `diff <(find "$1" | sed "s/$d1//") <(find "$2" | sed "s/$d2//") | grep ">" | sed "s/>//"`
do
    echo cp -rpa $2/$ff $1/$ff
done
