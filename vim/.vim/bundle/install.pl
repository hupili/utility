#!/usr/bin/perl -w
use strict ;

my %h_bundles = (
# snipmate: enable snippets completion using <tab>
"vim-snipmate" => "git://github.com/garbas/vim-snipmate.git",
# snipmate dependencies
"tlib_vim" => "https://github.com/tomtom/tlib_vim.git",
"vim-addon-mw-utils" => "https://github.com/MarcWeber/vim-addon-mw-utils.git",
# snippets repos:
"snipmate-snippets" => "https://github.com/honza/snipmate-snippets.git",
"snipmate-snippets-bib" => "https://github.com/rbonvall/snipmate-snippets-bib.git", 
# vcscommand: Using version control tool inside vim
"vcscommand" => "git://repo.or.cz/vcscommand",
# nerdtree: efficient project browsing
"nerdtree" => "https://github.com/scrooloose/nerdtree.git", 
) ;

for my $repo(keys %h_bundles){
	my $link = $h_bundles{$repo} ;	
	print "Install:\n\trepo:$repo\n\tlink:$link\n" ;
	if ( -e $repo ) {
		print "\t[already installed]\n" ;
	} else {
		print "\t[start to install]\n" ;
		`rm -rf $repo` ;
		`git clone $link $repo` ;
		print "\t[end of installation]\n" ;
	}
	if ( -d "$repo/doc/" ){
		print "\t[generate help files]\n" ;
		system qq(vim -c 'helptags $repo/doc/' -c 'q') ;
	}
}

exit 0 ;
