#!/usr/bin/perl -w 

#Convert the space separated 2-D table 
#to the latex tabular format.
#The former is obviously more convenient 
#for data process and analysis under linux.
#However, Latex recognizes the latter. 

use strict ;

while (<STDIN>){
	my $line = $_ ;	
	chomp($line) ;
	$line =~ s/^\s+//g ;
	$line =~ s/\s+/\t/g ;

	#the following line does not work!
	#So I first convert arbitrary space to tab,
	#and then split using tab..
	#my @a_line = split /\s+/, $line ;

	my @a_line = split /\t/, $line ;
	print $a_line[0] ;
	for (my $i = 1 ; $i < scalar @a_line ; $i ++ ){
		print " & $a_line[$i]" ;
	}
	print " \\\\\n" ;
}

exit 0 ;
