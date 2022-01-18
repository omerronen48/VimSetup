#!/usr/bin/env bash

echo "Installing HomeBrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Vim, ZSH, & OhMyZSH..."
sleep 1
brew install zsh
sleep 1
brew install vim
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 1
