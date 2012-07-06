#!/bin/bash
#hupili
#20111007
#check latex source file using 'aspell'
#simply list the mis-spelled words

#=========== 20120706
echo "This script is deprecated."
echo "Read the script file for explanation."
echo "Press Ctrl+C to end"
echo "Press any key to continue..."
read tmp

#It is known that the cascade command of detex and aspell 
#generates many non-meaningful entries. 
#Many of them are just human names, abbreviations. 
#A more important problem is they do not provide 
#straightforward warning in the article. 
#You need to locate them with search function of your editor.
#Now I advocate to use VIM's spell checking function:
#
#:set spell
#
#for more information: 
#   http://vimdoc.sourceforge.net/htmldoc/spell.html

#===========

if [[ $# == 1 ]] ; then
	file="$1"
else 
	echo "usage: $0 {file}"
	exit 255
fi

detex "$file" | aspell list | sort -u 

exit 0 
