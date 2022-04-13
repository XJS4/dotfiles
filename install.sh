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
    sudo pacman -S --needed fish zsh
    cp -r ./.zshrc $HOME/
    cp -r ./config.fish $HOME/.config/fish/
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
