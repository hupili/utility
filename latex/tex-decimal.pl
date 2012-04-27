#!/usr/bin/perl 

my $usage = "$0 {digits}" ;

#filter out extra decimal digits
my $ARGC = @ARGV ;
($ARGC == 1) or die("usage:$usage\n") ;
my $digits = $ARGV[0] ;

while (<STDIN>){
	$_ =~ s/(\.\d{$digits})(\d+)/$1/g ;	
	print $_ ;
}
