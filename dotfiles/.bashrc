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

export HISTSIZE=50000
export HISTFILESIZE=5000000

export EDITOR="vim"
alias vi='vim'

# Interactive operation; Keep safe!
alias rm='rm -i'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cd=_cd
#alias crontab='crontab -i'

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
# The following line causes man to fail
#alias less='less -r' # raw-control chars. Used to show color

# Git shortcuts
alias gita='git add'
alias gitc='git commit'
alias gits='git status .'

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

function mynotify()
{
    # Unified notification from
    # https://github.com/sickill/git-dude/blob/master/git-dude
    if [ $(which notify-send 2>/dev/null) ]; then
        notify_cmd='notify-send -i "$ICON_PATH" "$TITLE" "$DESCRIPTION"'
    elif [ $(which growlnotify 2>/dev/null) ]; then
        notify_cmd='growlnotify -n "$app_name" --image "$ICON_PATH" -m "$DESCRIPTION" "$TITLE"'
    elif [ $(which kdialog 2>/dev/null) ]; then
        notify_cmd='kdialog --icon $ICON_PATH --title "$TITLE" --passivepopup "$DESCRIPTION"'
    elif [ $(which notify 2>/dev/null) ]; then
        notify_cmd='notify --type information --icon "$ICON_PATH" --group "Git Commit" --title "$TITLE" "$DESCRIPTION"'
    elif [ $(which terminal-notifier 2>/dev/null) ]; then
        notify_cmd='terminal-notifier -title "$TITLE" -message "$DESCRIPTION"'
    fi

    local ICON_PATH="$1"
    local TITLE="$2"
    local DESCRIPTION="$3"

    if [ -n "$notify_cmd" ]; then
        eval $notify_cmd
    fi

    date "+%T %D"
    echo "$TITLE"
    if [ -n "$DESCRIPTION" ]; then
        echo "$DESCRIPTION"
    fi
    echo
}

genpasswd() {
    # http://www.cyberciti.biz/faq/linux-random-password-generator/
    local l=$1
    [ "$l" == "" ] && l=16
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

function _go_dir()
{
    full_path=`readlink -f $1`
    dir_name=`dirname $full_path`
    cd $dir_name
}
alias gd=_go_dir

function _mac_gt()
{
	if [[ "$1" != "" ]]; then
		open -a Terminal "$1"
	else
		open -a Terminal `pwd`
	fi
}

# Smarter cd
# Jump to dir if file name is given
function _cd()
{
    if [[ $# == 1 ]]; then
        if [[ -f "$1" ]]; then
            \cd `dirname $1`
        else
            \cd $1
        fi
    else
        \cd $@
    fi
}


function _init_mac() {
    # Launch MAC apps from command-line
    alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
    alias thunderbird="/Applications/Thunderbird.app/Contents/MacOS/thunderbird-bin"
    alias texmacs="/Applications/TeXmacs-1.99.1.app/Contents/MacOS/TeXmacs"
    alias skim="$HOME/Applications/Skim.app/Contents/MacOS/Skim"
    alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
    alias gemacs="open -a emacs"
    alias sublime="open -a 'Sublime Text 2'"
    alias atom="open -a Atom"
    #alias rstudio="open -a RStudio"
    # Solve the problem of Rcpp
    # See
    # http://stackoverflow.com/questions/21370363/link-error-installing-rcpp-library-not-found-for-lintl
    alias rstudio="PKG_LIBS=-L/usr/local/Cellar/gettext/0.18.3.2/lib open -a RStudio"

    # Terminal and GUI shortcuts
    test $_mac && alias go="open"
    test $_mac && alias gt=_mac_gt

    #source `brew --repository`/Library/Contributions/brew_bash_completion.sh
}

test $_mac && _init_mac


# Redirect UNIX commands to GNU Linux commands
#test $_unix && test `which gdate` && alias date=gdate

# To install GEMs under user directory
#export GEM_HOME=$HOME/.gem
#export GEM_PATH=$HOME/.gem:/usr/lib/ruby/gems/1.8/
export PATH=$PATH:$HOME/.gem/bin:/usr/local/share/npm/bin
export NODE_PATH=$NODE_PATH:$HOME/.npm/:/usr/local/share/npm/lib
# Following is to solve the complaint when installing yeoman
export NODE_PATH=$NODE_PATH:/usr/local/share/npm/lib/node_modules


#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

export PROMPT_COMMAND='history -a'

