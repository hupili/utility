#!/bin/bash

fullfile=$1
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
echo $filename
echo $extension

seq 0 300 900 | xargs -ISTART ffmpeg -y -i $fullfile  -ss START -t 200 $filename-START.$extension
