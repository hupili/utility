# base-files, tested on 4.2.24

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Interactive operation; Keep safe!
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias crontab='crontab -i'

# Some shortcuts for different directory listings
alias ls='ls -h --color=tty'                    # classify files in colour
alias ll='ls -l'                                # long list
alias sl='ls'                                   # avoid typo...

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
PS1='\[\e[32m\]\u@\h \[\e[33m\]${PWD/????????????????????????????*/...${PWD:${#PWD}-25}}\[\e[0m\]\n\$'

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
