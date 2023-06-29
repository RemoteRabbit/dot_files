#!/bin/bash

dirs() {
	for f in $(find "$HOME"/dot_files/.config/* -maxdepth 0); do
		if [[ $f != $HOME/dot_files/.config/zsh ]]; then
			link "$f"
		else
			files "$f"
		fi
	done
}

files() {
	for f in $(find "$1" -maxdepth 1 -type f); do
		link "$f"
	done
}

link() {
	ln -sfv "$f" "$HOME"/.config/
}

dirs
