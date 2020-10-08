ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

DISABLE_AUTO_UPDATE="true"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim='nvim'

export TERM='xterm-color'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export GOPATH="$HOME/go"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

fpath+=("/home/samuel/.nvm/versions/node/$(node --version)/lib/node_modules/pure-prompt/functions")
autoload -U promptinit; promptinit
prompt pure

plugins=(zsh-autosuggestions)

# Aliases for enabling wayland apps
alias mpv='mpv --gpu-context=wayland'
