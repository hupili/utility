#!/usr/bin/env bash
#hupili
#20120427

if [[ $# == 2 ]] ; then
	src=$1
	dest=$2
else
	echo "usage:$0 {src} {dest}"
	exit 255
fi

if [[ ! -f "$src" ]] ; then 
	echo "source doesn't exist: $src"
	exit 255
fi

if [[ -e "$dest" ]] ; then
	echo "destination already exists: $dest"
	exit 255
fi

echo "decrypt, decompress, and unarchive"
echo "source: $src"
echo "destination: $dest"
echo "input password:[or ctrl+c to terminate]"
read pass

echo "start time:`date`"
mkdir -p $dest
dd if=$src 2> /dev/null | openssl des3 -salt -d -k $pass | tar -xzvf - -C $dest
echo "end time:`date`"

exit 0 
