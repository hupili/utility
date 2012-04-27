#!/usr/bin/perl -w 

use strict ;

while (<STDIN>){
	my $line = $_ ;	
	chomp($line) ;
	$line =~ s/^\s+//g ;
	$line =~ s/\s+/\t/g ;
	#my @a_line = split /\s+/, $line ;
	my @a_line = split /\t/, $line ;
	print $a_line[0] ;
	for (my $i = 1 ; $i < scalar @a_line ; $i ++ ){
		print " & $a_line[$i]" ;
	}
	print " \\\\\n" ;
}

exit 0 ;
