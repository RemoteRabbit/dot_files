#!/bin/bash
# Install script for the project
#
# Author:  Tristan Jahnke

read -p "Would you like to install AwesomeWM " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	./scripts/install-awesomewm.sh
fi

# ./scripts/install-packages.sh
# ./scripts/install-dotfiles.sh
