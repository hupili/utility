#!/usr/bin/perl -w 
# hpl
# 20110814
#
# mount a whole disk image to multiple directory

use strict ;

my $_sudo = "sudo"; 

my %h_fstrans = (
	"ntfs" => "ntfs-3g", 
	"fat32" => "vfat"
) ;

#translate from parted's 'file system' to mount's 'type'
sub fs_trans{
	my ($fs_orig) = @_ ;
	if ( exists($h_fstrans{$fs_orig}) ){
		return $h_fstrans{$fs_orig} ;
	} else {
		return $fs_orig ;
	}	
}

#==========init===========

my $usage = "$0 {image-file} {main-directory}\n" 
. "\t{image-file} : in raw disk image format\n" 
. "\t{main-directory} : partitions will be mounted to \n" 
. "\t\t{main-directory}/p1\n" 
. "\t\t{main-directory}/p2\n" 
. "\t\t...\n" 
. "\t\t{main-directory}/p{n}" ;
my $ARGC = @ARGV ;
($ARGC == 2) or die("usage:$usage\n") ;

my $file = $ARGV[0] ;
my $dir = $ARGV[1] ;

#==========main============

#get partition infomation from 'parted'
my @a_partitions = () ;
my @a_lines = `parted $file unit B print` ;
my $_table = 0 ;
for (my $i = 0 ; $i < scalar @a_lines ; $i ++){
	if ( $a_lines[$i] =~ /^$/ ){
		$_table = ! $_table ;	
		next ;
	}	
	if ( $_table ){
		push @a_partitions, $a_lines[$i] ;	
	}
}
#print "@a_partitions" ;

#generate mount information
my %h_partitions = () ;
for (my $i = 1 ; $i < scalar @a_partitions ; $i ++){
	my $p = $a_partitions[$i] ;
	my @a_p = split /\s+/, $p ;
	#print scalar @a_p ;
	if ( scalar @a_p < 7 ) {
		next ;
	}
	my $number = $a_p[1] ;
	my $start = $a_p[2] ;
	my $end = $a_p[3] ;
	my $size = $a_p[4] ;
	my $type = $a_p[5] ;
	my $fs = $a_p[6] ;
	#print $number, ",", $start, ",", $fs, "\n" ;
	$h_partitions{$i}->{"offset"} = $start ;
	$h_partitions{$i}->{"sizelimit"} = $size ;
	$h_partitions{$i}->{"fs"} = fs_trans($fs) ;
}

#mount to subdirectory
foreach my $id(keys %h_partitions){
	my $offset = $h_partitions{$id}->{"offset"} ;
	my $sizelimit = $h_partitions{$id}->{"sizelimit"} ;
	my $fs = $h_partitions{$id}->{"fs"} ;
	my $ret = "" ;
	print("mkdir -p $dir/p$id\n") ;
	$ret = system("mkdir -p $dir/p$id") ;
	print "ret:$ret\n" ;
	print("$_sudo mount -o loop,offset=$offset,sizelimit=$sizelimit \"$file\" $dir/p$id\n") ;
	$ret = system("$_sudo mount -o loop,offset=$offset,sizelimit=$sizelimit \"$file\" $dir/p$id") ;
	print "ret:$ret\n" ;
}

exit 0 ;

