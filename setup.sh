#!/bin/bash

# Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file ~/dot_files/Brewfile

# Git setup

# Tmux setup
mkdir -p ~/.config/tmux
ln -s -f ~/dot_files/tmux.conf ~/.config/tmux/tmux.conf
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -f ~/dot_files/zshrc ~/.zshrc

# Neovim setup
git clone https://github.com/RemoteRabbit/nvim-setup.git ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
