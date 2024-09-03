# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then # Silicon mac
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then # Intel mac
  eval "$(/usr/local/bin/brew shellenv)"
fi
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib:$HOMEBREW_PREFIX/lib"

# ODIN lsp
export ODIN_ROOT=$(dirname $(dirname "$(greadlink -f $(which odin))"))/libexec 

# Bashmarks 
source ~/.local/bin/bashmarks.sh

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias vi="nvim"
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nir='npm remove --save'
alias nicelog='git log --all --decorate --oneline --graph'
eval $(thefuck --alias) 

# Allowing commits to be signed with a gpg key
export GPG_TTY=$TTY

# Starship 
eval "$(starship init zsh)"

