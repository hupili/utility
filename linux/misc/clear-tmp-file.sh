#!/bin/bash
#hupili
#20110830

if [[ $1 == "F" ]] ; then
	find . -name "*~" -exec rm -f {} \;
else
	find . -name "*~" -exec rm -i {} \;
fi


