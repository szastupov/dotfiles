autoload -U compinit && compinit
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on

if [ -n "$SSH_CONNECTION" ]; then
	PROMPT=$'%{\e[1;30m%}%m %{\e[1;34m%}%~ %{\e[1;31m%}%#%{\e[0m%} '
else
	PROMPT=$'%{\e[1;34m%}%~ %{\e[1;31m%}%#%{\e[0m%} '
fi

precmd() {
	[[ -t 1 ]] || return
	case $TERM in
		*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]0;[%~]\a"
		;;
		screen) print -Pn "\ek[%~]\e\\" && print -Pn "\e]0;[%~] %m (screen)\a"
		;;
	esac
}

preexec() {
	[[ -t 1 ]] || return
	case $TERM in
		*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]0;<$1> [%~]\a"
		;;
		screen) print -Pn "\ek<$1> [%~]\e\\" && print -Pn "\e]0;<$1> [%~] %m (screen)\a"
		;;
	esac
}

HISTFILE=~/.zhistory
SAVEHIST=5000
HISTSIZE=5000
DIRSTACKSIZE=20

setopt  APPEND_HISTORY
setopt  HIST_IGNORE_ALL_DUPS
setopt  HIST_IGNORE_SPACE
setopt  HIST_REDUCE_BLANKS
setopt  No_Beep

alias sr='ssh -l root'
alias go='gnome-open'
alias wcat='wget -q -O -'
alias ypsilon='rlwrap ypsilon'
alias e='emacs -nw'

(grep --help 2>/dev/null |grep -- --color) >/dev/null && \
export GREP_OPTIONS='--color=auto'

export PATH="${PATH}:/home/redchrom/prog/bin"
export EDITOR=vim

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

_force_rehash()
{
	(( CURRENT == 1 )) && rehash
	return 1
}

zstyle ':completion:*' completer _force_rehash _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' add-space true
#Kill tuning
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'  force-list always
zstyle ':completion:*:processes' command 'ps ax'
zstyle ':completion:*:processes-names' command 'ps axho command'
# Ignore parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
eval `dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

bindkey -d                  # reset
bindkey -e                 # emacs key bindings

#gnome-terminal fix
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

bindkey "^[OA" history-search-backward
bindkey "^[[A" history-search-backward
bindkey "^[OB" history-search-forward
bindkey "^[[B" history-search-forward
