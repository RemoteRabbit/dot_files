#!/bin/bash

echo "Installing Arch packages (pacman)..."
sudo pacman -S --needed base-devel git vim zsh

echo "Instal yay...."
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd $HOME/.yay
makepkg -si

echo "Installing Arch packages (yay)..."
yay -S --needed yay

# Set symlinks
sh ./linkup.sh
