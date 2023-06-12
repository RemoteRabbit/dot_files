#!/bin/bash

if [[ $(uname) == 'Linux' ]]; then
	if ! dpkg -s timer; then
		echo "Installing timer..."
		echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
		sudo apt-get update
		sudo apt-get install timer
	fi
elif [[ $(uname) == 'Darwin' ]]; then
	if ! brew list timer; then
		echo "Installing timer..."
		brew install timer
	fi
fi

brew install lolcat
