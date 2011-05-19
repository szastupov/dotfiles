autoload -U compinit && compinit
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on
autoload select-word-style
select-word-style Bash

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
	print -Pn "\e]0;[%m:%~]\a"
}

preexec() {
	[[ -t 1 ]] || return
	print -Pn "\e]0;<$1> [%m:%~]\a"
}

HISTFILE=~/.zhistory
SAVEHIST=5000
HISTSIZE=5000
DIRSTACKSIZE=20

setopt nobeep histignorealldups histignorespace histreduceblanks

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
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
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

. ~/dotfiles/common