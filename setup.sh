#!/bin/bash

# Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file ~/dot_files/Brewfile

# Git setup

# Tmux setup
mkdir -p ~/.config/tmux
ln -s -f ~/dot_files/tmux.conf ~/.config/tmux/tmux.conf

# Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -f ~/dot_files/zshrc ~/.zshrc

# Neovim setup
git clone https://github.com/RemoteRabbit/nvim-setup.git ~/.config/nvim
