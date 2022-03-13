#!/bin/bash

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
else
    echo "Have fun using my dotfiles"
    sudo pacman -S --needed fish zsh nvim
    cp -r ./.zshrc $HOME/
    cp -r ./config.fish $HOME/.config/fish/
fi
