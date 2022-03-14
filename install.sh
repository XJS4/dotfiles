#!/bin/bash

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
else
    echo "Have fun using my dotfiles"
    echo "##################################################"
    echo "####    Just doing some preliminary checks    ####"
    echo "##################################################"
    sudo pacman -S --needed fish zsh nvim
    cp -r ./.zshrc $HOME/
    cp -r ./config.fish $HOME/.config/fish/
    read -p "Do you have Vim-Plug installed? (y/n) " PLUGPREF
    case "$PLUGPREF" in
        [yY])
            echo "OK, I will now copy the config files."
            cp -r ./neovim/init.vim $HOME/.config/nvim/
            cp -r ./neovim/plugins.vim $HOME/.config/nvim/vim-plug/
            [ ! -d $HOME/.config/nvim/plug-config/ ] && mkdir $HOME/.config/nvim/plug-config/
            cp -r ./neovim/coc.vim $HOME/.config/nvim/plug-config/
            echo "Just remember to run :PlugInstall once you open Neovim in order to install the plugins."
            ;;
        [nN])
            echo "OK, I will now install vim-plug."
            curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            echo "Now copying the config files."
            cp -r ./neovim/init.vim $HOME/.config/nvim/
            cp -r ./neovim/plugins.vim $HOME/.config/nvim/vim-plug/
            [ ! -d $HOME/.config/nvim/plug-config/ ] && mkdir $HOME/.config/nvim/plug-config/
            cp -r ./neovim/coc.vim $HOME/.config/nvim/plug-config/
            echo "By the way, just remember to run :PlugInstall once you open Neovim in order to install the plugins."
            ;;
        *)
            echo "Please enter y or n"
            ;;
    esac
fi
