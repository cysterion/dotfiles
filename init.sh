#!/bin/bash
git submodule init
git submodule update --recursive
DATE_STRING=$(echo "$(date)" | tr -s ' ' | tr ' ' '_')
FILES=( "zshrc" "bashrc" "vimrc" "vim" )
for i in "${FILES[@]}"
do
    if [ -e "$HOME/.${i}" ]
    then
        mv -f "$HOME/.${i}" "$HOME/${i}_${DATE_STRING}"
    fi
    ln -s "$PWD/${i}" "$HOME/.${i}"
done
