# dotfiles 🌱

Because why spend 10 minutes if you can automate it in a couple of hours. 

## Prerequisites

Needs `zsh` to be the default shell (default since macOS )

## Usage 

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into new hidden directory.

```zsh
git clone --recurse-submodules https://github.com/kapoko/dotfiles.git ~/.dotfiles
```

3. Install (**warning**: this will overwrite existing config files in the home folder with symlinks)

```zsh
cd ~/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```
