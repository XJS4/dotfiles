#!/bin/bash

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
else
    echo "Have fun using my dotfiles"
    cp -r ./.zshrc $HOME/
    cp -r ./fish/config.fish $HOME/.config/fish/
fi
