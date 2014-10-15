gray=$'\[\e[1;30m\]'
blue=$'\[\e[1;34m\]'
red=$'\[\e[1;31m\]'
normal=$'\[\e[0m\]'
#PS1="$gray\h ${blue}\w ${red}\$${normal} "
PS1="${blue}\w ${red}\$${normal} "

SAVEHIST=5000
HISTSIZE=5000
HISTCONTROL=ignoredups

#if [ -f `brew --prefix`/etc/bash_completion ]; then
	#. `brew --prefix`/etc/bash_completion
#fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bashrc.d/git ]; then
	. ~/.bashrc.d/git 
	PS1="${red}\$(parse_git_branch)${normal}$PS1"
fi

. ~/dotfiles/common
