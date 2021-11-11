# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Bashmarks 
source ~/.local/bin/bashmarks.sh

ZSH_THEME="minimal"

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nir='npm remove --save'
eval $(thefuck --alias) 

# Nice git log
nicelog() {
    git log --all --decorate --oneline --graph $1
}