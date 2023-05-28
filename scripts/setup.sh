#!/bin/bash

# Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file "$HOME/dot_files/homebrew/Brewfile"

# Git setup

# Tmux setup
mkdir -p "$HOME/.config/tmux"
ln -s -f "$HOME/dot_files/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
git clone https://github.com/jimeh/tmuxifier.git "$HOME/.tmuxifier"
tmux source-file "$HOME/.config/tmux/tmux.conf"

# Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -f "$HOME/dot_files/zshrc" "$HOME/.zshrc"

# Neovim setup
mkdir -p "$HOME/.config/nvim"
ln -s -f "$HOME/dot_files/nvim" "$HOME/.config/nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
