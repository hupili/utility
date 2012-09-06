#!/usr/bin/env perl 
# Download Youtube video by multi-part HTTP queries. 
# No multi-thread / multi-process is used but this 
# can still accelerate your download by utilizing the 
# buffering phase. 
#
# Only tested for Youtube, but it may work for other 
# platforms. In one study during the course work of 
# IERG5270 - 2011, one found that Tudou's official 
# accelerator uses this property. They didn't have 
# proprietary protocols to help their client users.
#
# In the recent test of format 'webm', this script 
# shows inferior performance to direct wget download. 
# For one thing, wget can keep 10M rate at most time. 
# For another thing, intensive 'cat' operation (">>")
# of curl output make disk IO a possible bottleneck. 
# Just guess, no in depth study. 

use strict;
use warnings;

my $usage = "$0 {url} {file}" ;

my $ARGC = @ARGV ;
($ARGC == 2) or die("usage: $usage") ;
my $url = $ARGV[0];
my $file = $ARGV[1];

my $buffer_size = 2000000 ; #vary according to video type
my $maximum_blocks = 1000 ;

my @part = () ;

my $content = `curl -sI "$url"` ;
if ( $content =~ /Content-Length: (\d+)/ ){
	my $size = $1 ;
	my $cur = 0 ;
	while ( $size > $buffer_size ){
		$size -= $buffer_size ;
		push @part, {begin=>$cur, end=>($cur + $buffer_size - 1)} ;
		$cur += $buffer_size ;
	}
	push @part, {begin=>$cur, end=>($cur + $size - 1)} ;
} else {
	print STDERR "no Content-Length returned! degrade to single part download\n" ;
}

system qq( rm -f $file ) ;
if (scalar @part) {
	for my $i(0..(scalar @part - 1)){
		my $b = $part[$i]->{begin} ;
		my $e = $part[$i]->{end} ;
		#system qq( curl -s -r $b-$e "$url" > tmp.part ) ;
		#system qq( cat tmp.part >> $file ) ;
		#system qq( rm -f tmp.part ) ;
		system qq( curl -s -r $b-$e "$url" >> $file ) ;
		print STDERR "$b-$e downloaded!\n" ;
	}
} else {
	system qq( curl -s "$url" > $file ) ;
}

#my $part1_begin = 0 ;
#my $part1_end = int($size / 2) - 1 ;
#my $part2_begin = $part1_end + 1;
#my $part2_end = $size - 1 ;
##partial download
#print "size:$size\n" ;
#print "$part1_begin,$part1_end,$part2_begin,$part2_end\n" ;
#system qq( curl -s -r $part1_begin-$part1_end "$url" > m.part1 ) ;
#system qq( curl -s -r $part2_begin-$part2_end "$url" > m.part2 ) ;
#system qq( cat m.part1 m.part2 >> multi.flv) ;
#close HTML;
