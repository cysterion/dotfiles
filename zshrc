#!/usr/bin/env zsh
#brew install coreutils
#$(brew --prefix coreutils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.zsh/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export ADOTDIR="$HOME/.zsh/antigen"
source "$HOME/.zsh/autoload/antigen.zsh"

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle command-not-found
# antigen bundle colored-man-pages
# antigen bundle osx

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

# Tell Antigen that you're done.
antigen apply

source "$HOME/.profile"
# if [ -f 'brew --prefix'/etc/bash_completion ]; then
    # . 'brew --prefix'/etc/bash_completion
# fi

setopt prompt_subst
setopt correct

# Enable colors in prompt
export TERM=xterm-256color
export CLICOLOR=1

# detect coreutils
if [[ `which ls` =~ 'gnu' ]]
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

PROMPT='%b%f%~ %B%(?:%F{green}:%F{red})%(!.#.❯)%f%b '

RPROMPT=''
# Add the rvm to the prompt if it exists
if (( $+commands[rvm-prompt] ))
then
    RPROMPT="$RPROMPT%F{yellow}\$(rvm-prompt)%f"
fi
# Add my custom git-prompt to the prompt if it exists
if (( $+commands[git-prompt] ))
then
    RPROMPT="$RPROMPT\$(git-prompt --zsh -l)"
fi

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Attached a session if it has been detached from or create a new one
alias startTmux='(tmux ls | grep -vq attached && tmux at) || tmux'

# if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi

export PATH="$PATH:$HOME/workspace/universe/bin"

# added by travis gem
[ -f /Users/BrandonRoehl/.travis/travis.sh ] && source /Users/BrandonRoehl/.travis/travis.sh
