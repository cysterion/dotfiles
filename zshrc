#!/usr/bin/env zsh
#brew install coreutils
#$(brew --prefix coreutils)

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.zsh/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export ADOTDIR="$HOME/.zsh/bundle"
source "$HOME/.zsh/antigen/antigen.zsh"
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle BrandonRoehl/zsh-clean
# antigen bundle "$HOME/workspace/zsh-clean" --no-local-clone

# Tell Antigen that you're done.
antigen apply

source "$HOME/.profile"

setopt prompt_subst
setopt correct

# Enable colors in prompt
export TERM=xterm-256color

# Enable colored output for ls
export CLICOLOR=1 # MacOS
# For Linux or MacOS with brew install coreutils
if which dircolors &>/dev/null
then
    alias ls='ls --color=auto --classify'
    autoload -U colors
    colors
    eval $(dircolors)
fi
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

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Attached a session if it has been detached from or create a new one
alias startTmux='(tmux ls | grep -vq attached && tmux at) || tmux'

alias gca='git commit -a && git push'

# export PATH="$PATH:$HOME/workspace/universe/bin"

# Plugin configuration

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# Go to the full 256 bit colors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=203,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=84'
ZSH_HIGHLIGHT_STYLES[alias]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[function]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[builtin]='fg=177'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=177'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=99'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=50'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=45'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=$ZSH_HIGHLIGHT_STYLES[single-hyphen-option]
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=215'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=$ZSH_HIGHLIGHT_STYLES[single-quoted-argument]
ZSH_HIGHLIGHT_STYLES[assign]='fg=227'
ZSH_HIGHLIGHT_STYLES[redirection]=$ZSH_HIGHLIGHT_STYLES[assign]
ZSH_HIGHLIGHT_STYLES[comment]='fg=243'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=50'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=212'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=$ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]

