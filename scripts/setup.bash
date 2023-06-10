#!/bin/bash

DOTS=$HOME/dot_files

if [[ '$OSTYPE' == 'linux-gnu' ]]; then
    if [ ! dpkg -s zsh ]; then
        sudo apt-get install zsh
    fi
    sudo apt-get install build-essential
fi

# Kitty
ln -s -f $HOME/dot_files/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# Git setup
ln -s -f $HOME/dot_files/git/.gitconfig $HOME/.gitconfig

# Tmux setup
mkdir -p "$HOME/.config/tmux"
ln -s -f "$HOME/dot_files/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
[ -d "$HOME/.tmuxifier" ] && git -C "$HOME/.tmuxifier" pull || git clone https://github.com/jimeh/tmuxifier.git "$HOME/.tmuxifier"

# Neovim setup
mkdir -p "$HOME/.config/nvim"
ln -s -f "$HOME/dot_files/nvim" "$HOME/.config/nvim"
[ -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ] && git -C "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" pull || git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# Zsh setup
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
ln -s -f "$HOME/dot_files/.config/.zshrc" "$HOME/.zshrc"

# Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# source $HOME/.zshrc

echo -e "\n\ninstalling to $HOME/.config"
echo "=============================="
if [ ! -d "$HOME/.config" ]; then
    echo "Creating $HOME/.config"
    mkdir -p "$HOME/.config"
fi

for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done
