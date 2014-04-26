# Modified from robbyrussell.zsh-theme

if [[ `whoami` == "root" ]] ; then
	# Make the prompt RED to warn me that I'm using Root
	# For more colors, please refer to:
	#     http://praxis.edoceo.com/howto/bash
	local name_color="$fg[red]"
else
	local name_color="$fg[blue]"
fi

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$name_color%}%n@%m %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%} $_ENV_PROMPT
%%'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
