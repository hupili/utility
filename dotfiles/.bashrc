# base-files, tested on 4.2.24

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Setting system flag for customized commands
# Refs:
#    * http://en.wikipedia.org/wiki/Uname
if [[ `uname -s` == "Darwin" ]] ; then
	_mac=1
	_unix=1
fi
if [[ `uname -s` == "Linux" ]] ; then
	_linux=1
fi

# Vi-mode: http://blog.sanctum.geek.nz/vi-mode-in-bash/ 
# set -o vi

# Interactive operation; Keep safe!
alias rm='rm -i'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias crontab='crontab -i'

# Some shortcuts for different directory listings
# classify files in colour
#test $_linux && alias ls='ls -h --color=tty'
#test $_mac && alias ls='ls -h -G'
alias ls='ls -h --color=tty'
# long list
alias ll='ls -l'
# avoid typo...
alias sl='ls'                                   

# Other shortcuts
alias file-grep='xargs grep -l'
alias grep='grep --color'                       # show differences in colour
alias tailf='tail -f'
alias ms='chmod u+x'
alias rl='readlink -f'
alias vless="$HOME/.vim/macros/less.sh"

# Git shortcuts
alias gita='git add'
alias gitc='git commit'
alias gits='git status'

# The console style
if [[ `whoami` == "root" ]] ; then
	# Make the prompt RED to warn me that I'm using Root
	# For more colors, please refer to:
	#     http://praxis.edoceo.com/howto/bash
	PS1='\[\e[31m\]\u@\h \[\e[33m\]${PWD/????????????????????????????*/...${PWD:${#PWD}-25}}\[\e[0m\]\n\$'
else
	PS1='\[\e[32m\]\u@\h \[\e[33m\]${PWD/????????????????????????????*/...${PWD:${#PWD}-25}}\[\e[0m\]\n\$'
fi

# Colorful man pages
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'

# My own path
export PATH="$PATH:$HOME/utils"
if [[ -e "$HOME/.pathrc" ]]; then
	. $HOME/.pathrc
fi

# Unify coding: solves the MATLAB core dump problem
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Launch MAC apps from command-line
test $_mac && alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
test $_mac && alias thunderbird="/Applications/Thunderbird.app/Contents/MacOS/thunderbird-bin"

# Redirect UNIX commands to GNU Linux commands
#test $_unix && test `which gdate` && alias date=gdate

# To install GEMs under user directory
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem:/usr/lib/ruby/gems/1.8/
export PATH=$PATH:$HOME/.gem/bin
