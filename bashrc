# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
gray=$'\e[1;30m'
blue=$'\e[1;34m'
red=$'\e[1;31m'
normal=$'\e[0m'
PS1="$gray\h ${blue}\w ${red}\$${normal} "

SAVEHIST=5000
HISTSIZE=5000

alias vi='vim'
alias ls='ls --color=auto'
alias la='ls -lah --color=auto'
alias ll='ls -lh --color=auto'
alias du='du -h'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias df='df -h'
alias sr='ssh -l root'
alias go='gnome-open'
alias wcat='wget -q -O -'
alias ec='emacsclient'
alias sudo='A=`alias` sudo '

export GREP_OPTIONS='--color=auto'
export PYTHONSTARTUP=~/.pythonstartup
export EDITOR=vim
export GIT_EDITOR=$EDITOR
