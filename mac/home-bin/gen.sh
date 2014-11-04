#!/bin/bash

# For coreutils

src_dir="/usr/local/Cellar/coreutils/8.23_1/bin"

dst_dir="bin/core-utils"

for fn in `ls -1 $src_dir`
do
	echo Old: $fn
	new_fn=`echo $fn | cut -c2-`
	echo New: $new_fn
	ln -s -f $src_dir/$fn $dst_dir/$new_fn
done

exit 0
