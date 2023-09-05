#!/bin/bash

echo "Linking .config files..."
for f in $(find "$HOME"/dot_files/.config/* -maxdepth 0); do
	ln -sfv "$f" "$HOME"/.config/
done

ln -sfv "$HOME/dot_files/.zshenv" "$HOME/.zshenv"
