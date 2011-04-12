if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

gray=$'\[\e[1;30m\]'
blue=$'\[\e[1;34m\]'
red=$'\[\e[1;31m\]'
normal=$'\[\e[0m\]'
PS1="$gray\h ${blue}\w ${red}\$${normal} "

SAVEHIST=5000
HISTSIZE=5000

. ~/dotfiles/common