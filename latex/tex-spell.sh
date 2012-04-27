#!/bin/bash
#hupili
#20111007
#check latex source file using 'aspell'
#simply list the mis-spelled words

if [[ $# == 1 ]] ; then
	file="$1"
else 
	echo "usage: $0 {file}"
	exit 255
fi

detex "$file" | aspell list | sort -u 

exit 0 
