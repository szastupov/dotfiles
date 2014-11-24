function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

gray=$'\[\e[1;30m\]'
blue=$'\[\e[1;34m\]'
red=$'\[\e[1;31m\]'
normal=$'\[\e[0m\]'
PS1="${blue}\w${gray}\$(parse_git_branch) ${red}\$${normal} "
PS1="${normal}$PS1"

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

. ~/dotfiles/common
