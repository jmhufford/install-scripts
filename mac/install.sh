#!/bin/bash
# Assumes github ssh key set up
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew install stow htop ncdu tmux

cd ~
git clone git@github.com:jmhufford/.dotfiles.git
./.dotfiles/install.sh

brew install --cask firefox


