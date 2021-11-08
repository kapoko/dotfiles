#!/bin/zsh

DOTFILES_ROOT=$(pwd -P)

info () {
  printf "\r🌱 $1\n"
}

info 'Installing symlinks'
ln -svi ~/.dotfiles/.zshrc ~/.zshrc
ln -svi ~/.dotfiles/.gitconfig ~/.gitconfig

info 'Installing Homebrew'
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

info 'Installing Oh My ZSH'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source $ZSH/oh-my-zsh.sh

unset -f info