#!/bin/bash

if [[ '$OSTYPE' == 'linux-gnu' ]]; then
    if [ ! dpkg -s zsh ]; then
        sudo apt-get install zsh
    fi
    sudo apt-get install build-essential
fi

# Git setup
ln -s -f $HOME/dot_files/git/gitconfig $HOME/.gitconfig

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
[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/" ] && git -C "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git -C "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" pull || git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] && git -C "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" pull || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
ln -s -f "$HOME/dot_files/zsh/zshrc" "$HOME/.zshrc"
ln -s -f "$HOME/dot_files/zsh/p10k.zsh" "$HOME/.p10k.zsh"

# Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# source $HOME/.zshrc

brew bundle install --file "$HOME/dot_files/homebrew/Brewfile"

tmux source-file "$HOME/.config/tmux/tmux.conf"
