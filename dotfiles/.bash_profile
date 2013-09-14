# Load bashrc if this is the login shell
# Refs:
#    * http://stackoverflow.com/questions/7780030/how-to-fix-terminal-not-loading-bashrc-on-os-x-lion
[[ -s ~/.bashrc ]] && source ~/.bashrc

which "rbenv" &> /dev/null
if [[ "$?" == "0" ]]; then
	eval "$(rbenv init -)"
fi
