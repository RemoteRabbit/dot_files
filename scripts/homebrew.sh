#!/bin/bash

echo "Checking for homebrew..."
if test ! "$(which brew)"; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Homebrew found!"

echo "Installing homebrew packages..."

declare -a packages=(
	"awscli"
	"cmatrix"
	"docker"
	"git"
	"helm"
	"kubernetes-cli"
	"minikube"
	"neofetch"
	"neovim"
	"node"
	"pipx"
	"python"
	"python3"
	"qemu"
	"starship"
	"terraform"
	"tflint"
	"tmux"
	"virt-manager"
	"virtualenv"
)

for package in "${packages[@]}"; do
	echo "Installing $package..."
	brew install "$package"
done
