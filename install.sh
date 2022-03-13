#!/bin/bash

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
else
    echo "Have fun using my dotfiles"
    sudo pacman -S --needed fish zsh nvim
    cp -r ./.zshrc $HOME/
    cp -r ./config.fish $HOME/.config/fish/
    read -p "Do you have Vim-Plug installed? (y/n) " PLUGPREF
    case "$PLUGPREF" in
        [yY])
            echo "OK, I will now copy the config files."
            cp -r ./neovim/init.vim $HOME/.config/nvim/
            cp -r ./neovim/plugins.vim $HOME/.config/nvim/vim-plug/
            ;;
        [nN])
            echo "OK, I will now install vim-plug."
            ;;
        *)
            echo "Please enter y or n"
            ;;
    esac
fi
