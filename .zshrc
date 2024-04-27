# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Homebrew
if [ -f /opt/homebrew/bin/brew ]; then # Silicon mac
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then # Intel mac
  eval "$(/usr/local/bin/brew shellenv)"
fi
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib:$HOMEBREW_PREFIX/lib"

# Bashmarks 
source ~/.local/bin/bashmarks.sh

source $ZSH/oh-my-zsh.sh

# p10k
source $HOMEBREW_PREFIX/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
