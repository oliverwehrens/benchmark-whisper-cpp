#!/bin/sh

# loop over files
for file in `ls -t  2022-12-28_13:28:57*_output.txt`; do
    t=`cat $file| grep "total time"| awk '{print $5}'`
    core=`echo $file|awk 'BEGIN { FS = "_" } ; { print $3 }'`
    model=`echo $file|awk 'BEGIN { FS = "_" } ; { print $4 }'`

    echo "${model},${core},${t}"
done