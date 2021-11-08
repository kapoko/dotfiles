# dotfiles 🌱


## Usage 

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:kapoko/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/kapoko/dotfiles.git ~/.dotfiles
```


3. Install

```zsh
cd ~/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```
