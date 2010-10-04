autoload -U compinit && compinit
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on

gray=$'%{\e[1;30m%}'
blue=$'%{\e[1;34m%}'
red=$'%{\e[1;31m%}'
normal=$'%{\e[0m%}'

if [ -n "$SSH_CONNECTION" ]; then
	PROMPT_HOST="$gray%m "
else
	PROMPT_HOST=''
fi

PROMPT="${PROMPT_HOST}${blue}%~ ${red}%#${normal} "

precmd() {
	[[ -t 1 ]] || return
	case $TERM in
		*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]0;[%~]\a"
		;;
		screen) print -Pn "\ek[%~]\e\\"
		;;
	esac
}

preexec() {
	[[ -t 1 ]] || return
	case $TERM in
		*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]0;<$1> [%~]\a"
		;;
		screen) print -Pn "\ek<$1> [%~]\e\\"
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
alias ypsilon='rlwrap ypsilon'
alias ocaml='rlwrap ocaml'
alias ec='emacsclient'
alias sudo='A=`alias` sudo '

(grep --help 2>/dev/null |grep -- --color) >/dev/null && \
export GREP_OPTIONS='--color=auto'
export PYTHONSTARTUP=~/.pythonstartup
export EDITOR=vim
export GIT_EDITOR=$EDITOR

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
