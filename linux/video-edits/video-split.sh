#!/bin/bash

if [[ $# != 3 ]]; then
	echo "$0 {filename} {segment} {total}"
	exit 255
fi

fullfile=$1
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
echo $filename
echo $extension

segment=$2
total=$3

seq 0 $segment $total | xargs -ISTART ffmpeg -y -i $fullfile  -ss START -t $segment $filename-START.$extension


