#!/usr/bin/env perl
#Author: hupili
#Initiate Date: 20120817
#
#This script allows for flexible configuration of 
#Vim pakcages. It downloads the package automatically,
#install it and perform required post-processing. 
#
#Prerequisites:
#   * vim-pathogen is installed. 
#     https://github.com/tpope/vim-pathogen/
#   * Place this script in its default
#     'bundle' directory. 
#
#Configure the %h_bundles variable accordingly. 
#Format:
#    "<tool>:<subdir>" => "<url>"
#Supported <tool>'s are:
#   * git : use git:// or https:// to clone repository. 
#   * zip : a standard zip archive format of vim plugin.

use strict ;

my %h_bundles = (
# snipmate: enable snippets completion using <tab>
"git:vim-snipmate" => "git://github.com/garbas/vim-snipmate.git",
# snipmate dependencies
"git:tlib_vim" => "https://github.com/tomtom/tlib_vim.git",
"git:vim-addon-mw-utils" => "https://github.com/MarcWeber/vim-addon-mw-utils.git",
# snippets repos:
#"git:snipmate-snippets" => "https://github.com/honza/snipmate-snippets.git",
"git:snipmate-snippets" => "https://github.com/hupili/snipmate-snippets.git",
"git:snipmate-snippets-bib" => "https://github.com/rbonvall/snipmate-snippets-bib.git", 
# vcscommand: Using version control tool inside vim
"git:vcscommand" => "git://repo.or.cz/vcscommand",
# nerdtree: efficient project browsing
"git:nerdtree" => "https://github.com/scrooloose/nerdtree.git", 
# taglist: 
"zip:taglist" => "http://vim.sourceforge.net/scripts/download_script.php?src_id=7701", 
# markdown:
"git:markdown" => "https://github.com/tpope/vim-markdown.git",
# powerline:
"git:vim-powerline" => "git://github.com/Lokaltog/vim-powerline.git",
) ;

for my $plugin(keys %h_bundles){
	my $link = $h_bundles{$plugin} ;	
	my $repo = "" ;
	my $tool = "" ;
	if ( $plugin =~ /^(.+):(.+)$/ ){
		$tool = $1 ;
		$repo = $2 ;
	}
	print "Install:\n\trepo:$repo\n\tlink:$link\n" ;
	if ( -e $repo ) {
		print "\t[already installed]\n" ;
	} else {
		print "\t[start to install]\n" ;
		`rm -rf $repo` ;
		if ( $tool eq "git" ) {
			`git clone $link $repo` ;
		}
		elsif ( $tool eq "zip" ) {
			`mkdir -p $repo` ;
			`wget "$link" -O $repo/$repo.zip` ;
			`cd $repo; unzip $repo.zip` ;
		}
		else {
			print STDERR "unrecognized tool:$tool\n" ;
		}
		print "\t[end of installation]\n" ;
	}
	if ( -d "$repo/doc/" ){
		print "\t[generate help files]\n" ;
		system qq(vim -c 'helptags $repo/doc/' -c 'q') ;
	}
}

exit 0 ;
