#!/bin/sh
git submodule init
git submodule update --recursive
DATE_STRING=$(echo "$(date)" | tr -s ' ' | tr ' ' '_')
FILES=( "zshrc" "bashrc" "vimrc" "vim" "tmux.conf" "profile" )
for i in "${FILES[@]}"
do
    if [ -e "$HOME/.${i}" ]
    then
        mv -f "$HOME/.${i}" "$HOME/${i}_${DATE_STRING}"
    fi
    ln -s "$PWD/${i}" "$HOME/.${i}"
    if [ $? -eq 0 ]; then
        echo "Installed: $HOME/.${i}"
    else
        echo "Install failed to symlink. See GitHub.com/BrandonRoehl/dotfiles for help"
        exit 1
    fi
done
