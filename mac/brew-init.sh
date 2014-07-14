#!/bin/bash

# Init cask
brew tap homebrew/cask
brew install brew-cask
brew cask update

brew tap homebrew/dupes

# http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
# 1. 
brew install coreutils
brew install binutils
brew install diffutils
brew install ed --default-names
brew install findutils --default-names
brew install gawk
brew install gnu-indent --default-names
brew install gnu-sed --default-names
brew install gnu-tar --default-names
brew install gnu-which --default-names
brew install gnutls --default-names
brew install grep --default-names
brew install gzip
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget
# 2. 
brew install bash
brew install emacs
brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.
brew install gpatch
brew install m4
brew install make
brew install nano
# 3. 
brew install file-formula
brew install git
brew install less
brew install openssh --with-brewed-openssl
brew install perl518   # must run "brew tap homebrew/versions" first!
brew install python --with-brewed-openssl
brew install rsync
brew install svn
brew install unzip
brew install vim --override-system-vi
brew install macvim --override-system-vim --custom-system-icons
brew install zsh
