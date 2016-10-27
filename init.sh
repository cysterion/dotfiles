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
    echo "Installed: $HOME/.${i}"
done
