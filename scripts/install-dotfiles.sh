#!/bin/bash

function underline() {
	echo -e "\e[4m$1\e[0m"
}

echo "
-------------------------------------------------------------    
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
-------------------------------------------------------------"

if [ -d "$HOME/.config" ]; then
	echo ".config directory found!"
else
	echo "Creating .config directory..."
	mkdir $HOME/.config
fi

configFolders=(
	"alacritty"
	"awesome"
	"betterlockscreen"
	"nvim"
	"picom"
	"rofi"
	"zsh"
)

configFiles=(
	".zshenv"
	"starship.toml"
)

underline "\nLinking config folders!"
for config in "${configFolders[@]}"; do
	if [ -d "$HOME/.config/$config" ]; then
		echo "$config found, skipping..."
	else
		echo "$config not found, creating..."
		ln -s "$HOME/dot_files/$config" "$HOME/.config"
	fi
done

underline "\nLinking config files!"
for file in "${configFiles[@]}"; do
	if [ -f "$HOME/.config/$file" ]; then
		echo "$file found, skipping..."
	else
		echo "$file not found, creating..."
		ln -s "$HOME/dot_files/$file" "$HOME/.config"
	fi
done
