#!/bin/bash

pip=${PIP:-pip}

for tools in $*
do
    show=$($pip show -f $tools)
    location=$(awk '$1 == "Location:" { print $2 }' <<< "$show")
    test "$location" != ''
    grep '^  ' <<< "$show" | sed "s%^  %${location}\/%" | perl -pE '1 while s{/[^/]+/\.\.(?=/)}{}'
done
