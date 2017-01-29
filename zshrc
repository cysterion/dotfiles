#!/bin/zsh
local DOTDIR="${$(readlink ~/.zshrc)/%\/zshrc}"
if [ -z $DOTDIR ]; then
    DOTDIR='~'
fi

#brew install coreutils
#$(brew --prefix coreutils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$DOTDIR/scripts"
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
RPROMPT='$(git-prompt -c) %{$fg[yellow]%}$(rvm-prompt)%{$reset_color%}'

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Reload the zshrc
function reload {
    source ~/.zshrc
    echo 'reloaded'
}

# Attatch to a session if it has been detatched from or create a new one
alias startTmux='(tmux ls | grep -vq attached && tmux at) || tmux'

# Prints out the current bash version
alias version='echo $BASH_VERSION'

function dotUpdate {
    echo 'Updating git repositories for vim pathogen plugins'
    currentPath=$PWD
    cd $DOTDIR
    git submodule foreach \
        '
        git clean -fdx;
        git reset --hard;
        git checkout master -f;
        git pull origin master -f;
        '
    cd $currentPath
}

# This updates everything that is command line
function update {
    echo 'Updating brew and brew installed items'
    brew update
    brew upgrade
    # brew cleanup
    dotUpdate
}

## FF ## First thing I ever wrote in shell and the first thing to make it's way
# to my bash profile show and hide hidden files on mac os x
function toggleHidden {
    local current_value=$(defaults read com.apple.finder AppleShowAllFiles)
    if [ $current_value = TRUE ]
    then
        echo 'Files are now hidden'
        defaults write com.apple.finder AppleShowAllFiles FALSE
    else
        echo 'Files are now visible'
        defaults write com.apple.finder AppleShowAllFiles TRUE
    fi
    killall Finder
}

# Command not found
# if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
