#!/usr/bin/perl
# Stip all comments
# From: http://arxiv.org/help/faq/whytex
#
while(<STDIN>){ 
	# Comments at the front: ^%xxxx
	s/^\%.*$/\%/;  	
	# Comments in the middle: ^....%xxxx
	# Escape of '%' is avoided: ^...\%xxx
	s/([^\\])\%.*$/\1\%/g; 
	print; 
} ;

# Bad cases:
#    * ^...\\%There is a new line before this comment...

exit(0);
