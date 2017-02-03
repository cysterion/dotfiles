#!/usr/bin/env zsh
#brew install coreutils
#$(brew --prefix coreutils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.universe/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source "$HOME/.profile"
if [ -f 'brew --prefix'/etc/bash_completion ]; then
    . 'brew --prefix'/etc/bash_completion
fi

setopt prompt_subst
setopt correct

# Enable colors in prompt
export TERM=xterm-256color
export CLICOLOR=1
alias ls='ls --color=auto --classify'
autoload -U colors
colors
eval $(dircolors)

# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

PROMPT='%(!.%{$bg[yellow]$fg[black]%}.%{$fg_bold[red]%})%n%{$fg_bold[white]%}|%{$reset_color%}%~%# '
RPROMPT='%{$fg[yellow]%}$(rvm-prompt)%{$reset_color%} $(git-prompt --zsh)'

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Reload the zshrc
function reload {
    source ~/.zshrc
    echo 'reloaded'
}

# Attatch to a session if it has been detatched from or create a new one
alias startTmux='(tmux ls | grep -vq attached && tmux at) || tmux'

# Command not found
# if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
