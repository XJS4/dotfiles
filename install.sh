#!/bin/bash

# ------        ------
# \     \      /     /
#  \     \    /     /
#   \     \  /     /
#    \     \/     /
#    /     /\     \
#   /     /  \     \
#  /     /    \     \
# /     /      \     \
# ------        ------
# I will start using Emacs as my default editor, so my neovim config will eventually become reduntant



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
    read -p "Would you like to install my Neovim or my Emacs config? " VIMOREM
    case "$VIMOREM" in
        [emacs])
            sudo pacman -S emacs
            read -p "Would you like to install Doom Emacs, or just leave it as the default? (doom/default) " DOOM
            case "$DOOM" in
                [doom])
                    echo "OK, now installing Doom Emacs."
                    echo "Just a warning, if Doom Emacs has an error, you should run ~/.emacs.d/bin/doom sync in order to fix the installation."
                    rm -rfv $HOME/.emacs.d/
                    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
                    $HOME/.emacs.d/bin/doom install
                    ;;
                [default])
                    "OK, leaving the emacs config alone."
                    ;;
                *)
                    "Please choose either doom or default."
                    ;;
                esac
            ;;
        [neovim])
            sudo pacman -S nvim
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
            ;;
        *)
            "Please select either neovim or emacs."
            ;;
    esac
    read -p "Would you like to install my i3-gaps config?" ITHREE
    case "$ITHREE" in
        [yY])
            echo "Now installing i3-gaps and my i3 config."
            sudo pacman -S --needed i3-gaps i3blocks i3lock i3status
            cp -r ./i3/config $HOME/.config/i3/
            ;;
        [nN])
            echo "OK i3-gaps won't be installed."
            ;;
        *)
            echo "Please enter y or n"
            ;;
    esac
    [ ! -d $HOME/Pictures ] && mkdir $HOME/Pictures
    [ ! -d $HOME/Pictures/Wallpapers/ ] && mkdir $HOME/Pictures/Wallpapers/
    cp -r ./Nord\ Hills.png $HOME/Pictures/Wallpapers/
fi