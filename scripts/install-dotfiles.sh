#!/bin/bash

echo "-------------------------------------------------------------    
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
-------------------------------------------------------------    
"

if [ -d "$HOME/.config" ]; then
	echo ".config directory exists, skipping..."
else
	echo "Creating .config directory..."
	mkdir $HOME/.config
fi

configFolders=(
	"alacritty"
	"awesome"
	"picom"
	"rofi"
	"zsh"
)

for config in "${configFolders[@]}"; do
	# echo "Checking for $config..."
	if [ -d "$HOME/.config/$config" ]; then
		echo "$config found, skipping..."
	else
		echo "$config not found, creating..."
		ln -s "$HOME/dot_files/$config" "$HOME/.config"
	fi
done
