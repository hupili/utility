#!/usr/bin/perl 

#Eliminate extra digits after decimal point
#by string matching and substituting. 
#
#I'm not sure whether tex itself has such function.
#Say by supplying one paramter in the tabular 
#environment, rather than facilating scripts. 

my $usage = "$0 {digits}" ;

#filter out extra decimal digits
my $ARGC = @ARGV ;
($ARGC == 1) or die("usage:$usage\n") ;
my $digits = $ARGV[0] ;

while (<STDIN>){
	$_ =~ s/(\.\d{$digits})(\d+)/$1/g ;	
	print $_ ;
}
