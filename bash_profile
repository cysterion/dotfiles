#!/usr/bin/env bash
# Set up AndroidSDK for adb
export PATH=$PATH:~/AndroidSDK/platform-tools/
# Color bash
export TERM=xterm-256color
export CLICOLOR=1

# Use Apple command line developer tools
# Using implicit path
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source "$(xcode-select -p)/usr/share/git-core/git-completion.bash"
source "$(xcode-select -p)/usr/share/git-core/git-prompt.sh"
source "$HOME/.profile"
test -e "$HOME/.iterm2_shell_integration.bash" && source "$HOME/.iterm2_shell_integration.bash"
if [ -f 'brew --prefix'/etc/bash_completion ]; then
    . 'brew --prefix'/etc/bash_completion
fi

# This is the stuff for making bash pretty
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[33m\]$(rvm-prompt)\[\033[0m\]:\W\[\033[0m\]$(__git_ps1 "\[\033[1;33m\](\[\033[0;35m\]⎇ %s\[\033[1;33m\])") \[\033[1;36m\]\u\[\033[0m\]$ '

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Reload the bash profile
alias reload="source ~/.bash_profile; echo 'reloaded'"

# Attatch to a session if it has been detatched from or create a new one
alias startTmux='(tmux ls | grep -vq attached && tmux at) || tmux'

# iCloud Drive referance
alias iCloud='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'

# Prints out the current bash version
alias version='echo $BASH_VERSION'

function init {
    type brew >/dev/null || { /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }
    if [ ! -d ~/.vim ]; then
        git clone https://github.com/tpope/vim-pathogen ~/.vim
    fi 
    if [ ! -d ~/.vim/bundle ]; then mkdir ~/.vim/bundle ; fi 
    if [ ! -d ~/.vim/bundle/nerdcommenter ]; then
        git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
    fi 
    if [ ! -d ~/.vim/bundle/nerdtree ]; then
        git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    fi 
    if [ ! -d ~/.vim/bundle/syntastic ]; then
        git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
    fi 
    if [ ! -d ~/.vim/bundle/vim-airline ]; then
        git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
    fi 
    if [ ! -d ~/.vim/bundle/vim-signify ]; then
        git clone https://github.com/mhinz/vim-signify.git ~/.vim/bundle/vim-signify
    fi 
}

# This updates everything that is command line
function update {
    init
    echo 'Updating brew and brew installed items'
    brew update
    brew upgrade
    # brew cleanup
    echo 'Updating git repositories for vim pathogen plugins'
    find ~/.vim/ -type d -name .git -execdir git -C {}/.. pull origin master \;
}

## FF ## First thing I ever wrote in shell and the first thing to make it's way to my bash profile
# Show and hide hidden files on mac os x
function toggleHidden {
    current_value=$(defaults read com.apple.finder AppleShowAllFiles)
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

# Create a blank java main method
function mkmainJava {
    if [ $# -eq 0 ]
    then
        echo 'Need class name argument'
    else
        for CLASS in $@
        do
            if [ -f "$CLASS.java" ]
            then
                echo "$CLASS.java already exists"
            else
                echo "public class $CLASS {" >> "$CLASS.java"
                echo "    public static void main(String[] args){" >> "$CLASS.java"
                echo "        " >> "$CLASS.java"
                echo "    }" >> "$CLASS.java"
                echo "}" >> "$CLASS.java"
                echo "$CLASS.java with main was created successfuly"
            fi
        done
    fi
}

