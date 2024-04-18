#! /bin/bash

DOTFILES=(.gitignore .zshrc)

for dotfile in $(echo ${DOTFILES[*]});
do
    cp ./$(echo $dotfile) ../$(echo $dotfile)
done
