export PATH=$PATH:~/AndroidSDK/platform-tools/
export TERM=xterm-256color
export CLICOLOR=1
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source "$HOME/.profile"
if [ -f 'brew --prefix'/etc/bash_completion ]; then
    . 'brew --prefix'/etc/bash_completion
fi

setopt prompt_subst
setopt correct
# Enable colors in prompt
autoload -U colors 
colors
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_OPEN="%{$fg_bold[yellow]%}(%{$reset_color%}"
GIT_PROMPT_COLOR="%{$fg[magenta]%}"
GIT_PROMPT_SYMBOL="⎇"
GIT_PROMPT_AHEAD="↑NUM"
GIT_PROMPT_AHEAD_COLOR="%{$fg[green]%}"
GIT_PROMPT_BEHIND="↓NUM"
GIT_PROMPT_BEHIND_COLOR="%{$fg[yellow]%}"
GIT_PROMPT_MERGING="∑"
GIT_PROMPT_MERGING_COLOR="%{$fg[cyan]%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}*%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}+%{$reset_color%}"
GIT_PROMPT_CLOSE="%{$fg_bold[yellow]%})%{$reset_color%}"

# Show different symbols as appropriate for various Git repository states
function git_prompt {
    local GIT_WHERE="$(git symbolic-ref -q HEAD 2> /dev/null \
        || git name-rev --name-only --no-undefined --always HEAD 2> /dev/null)"
    if [[ -n "$GIT_WHERE" ]]; then
        local GIT_COLOR="$GIT_PROMPT_COLOR"
        # Compose this value via multiple conditional appends.
        local GIT_STATE=""

        if ! git diff --quiet 2> /dev/null; then
            GIT_STATE="$GIT_STATE$GIT_PROMPT_MODIFIED"
        fi

        if ! git diff --cached --quiet 2> /dev/null; then
            GIT_STATE="$GIT_STATE$GIT_PROMPT_STAGED"
        fi

        local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null\
            | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            GIT_COLOR="$GIT_PROMPT_AHEAD_COLOR"
            GIT_STATE="$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}"
        fi

        local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null\
            | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            GIT_COLOR="$GIT_PROMPT_BEHIND_COLOR"
            GIT_STATE="$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}"
        fi

        local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            GIT_COLOR="$GIT_PROMPT_MERGING_COLOR"
            GIT_STATE="$GIT_STATE$GIT_PROMPT_MERGING"
        fi

        # Compose the final git status line
        local GIT_STRING="$GIT_PROMPT_OPEN$GIT_COLOR$GIT_PROMPT_SYMBOL ${GIT_WHERE#(refs/heads/|tags/)}%{$reset_color%}"
        if [[ -n $GIT_STATE ]]; then
            GIT_STRING="$GIT_STRING $GIT_STATE%{$reset_color%}"
        fi
        echo "$GIT_STRING$GIT_PROMPT_CLOSE"
    fi
}

PROMPT='%{$fg_bold[cyan]%}%n%{$reset_color%}|%~$(git_prompt)$ '
RPROMPT='%{$fg[yellow]%}$(rvm-prompt)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Copies the current path to the clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

# Reload the zshrc
alias reload="source ~/.zshrc; echo 'reloaded'"

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

