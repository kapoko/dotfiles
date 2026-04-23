case "$(uname -s)" in
  Linux*)  OS="linux" ;;
  Darwin*) OS="macos" ;;
  *)       OS="other" ;;
esac

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"

if [[ "$OS" == "linux" ]]; then
  export LC_ALL="C.UTF-8"

  if [[ -f /srv/taartdoos-server/.env ]]; then
    set -a
    source /srv/taartdoos-server/.env
    set +a
  fi
fi

if [[ "$OS" == "macos" ]]; then
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}/usr/local/lib:${HOMEBREW_PREFIX:-/usr/local}/lib"

  if command -v odin >/dev/null 2>&1 && command -v greadlink >/dev/null 2>&1; then
    export ODIN_ROOT="$(dirname "$(dirname "$(greadlink -f "$(which odin)")")")/libexec"
  fi

  [[ -f "$HOME/.local/bin/bashmarks.sh" ]] && source "$HOME/.local/bin/bashmarks.sh"

fi

if command -v gpg >/dev/null 2>&1 && command -v tty >/dev/null 2>&1; then
  export GPG_TTY="$(tty)"
fi

export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:/bin:/snap/bin"
export SYSTEMD_EDITOR="vim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm, without auto-using the default version

source "$ZSH/oh-my-zsh.sh"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

fuck() {
  unset -f fuck
  eval "$(thefuck --alias)"
  fuck "$@"
}

alias nicelog='git log --all --decorate --oneline --graph'
alias vim="nvim"
alias vi="nvim"
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nir='npm remove --save'
