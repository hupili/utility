#!/bin/bash

dir="/usr/local/Cellar/coreutils/8.21/bin"

for fn in `ls -1 $dir`
do
	echo $fn
	new_fn=`echo $fn | cut -c2-`
	echo $new_fn
	ln -s $dir/$fn $new_fn
done

exit 0
