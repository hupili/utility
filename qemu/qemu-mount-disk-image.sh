#!/bin/bash
# hpl
# 20110814
#
# mount qemu-disk-image file to a directory
# note that only the first partition can be visible from this script

usage="$0 {qemu-disk-image} {directory}"

if [[ $# == 2 ]] ; then 
	di=$1
	dir=$2
else
	echo $usage
	exit 255 
fi

# I forget how to this magic number come out... 
# By principle, it skips the first cylinder so that the rest is a pure
# partition image which can be mounted like normal devices. 
sudo mount -o loop,offset=32256 $di $dir

#TODO:
#    If you have correct/better explanantions for the above magic number, 
#    please kindly drop me a message. 

exit 0 
