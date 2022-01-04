#!/bin/zsh

DOTFILES_ROOT=$(pwd -P)

info () {
  printf "\r🌱 $1\n"
}

info 'Setting macOS defaults'
chmod +x ./.macos && ./.macos

info 'Installing Oh My ZSH'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

info 'Installing Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

info 'Installing brew formulae'
brew bundle --file ~/.dotfiles/Brewfile

info 'Installing bashmarks'
(cd bashmarks && make install)

info 'Installing symlinks'
ln -svf ~/.dotfiles/.zshrc ~/.zshrc
ln -svf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -svf ~/.dotfiles/.sdirs ~/.sdirs
ln -svf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

info 'Done! Reload the shell for all changes to take effect.'

unset -f info