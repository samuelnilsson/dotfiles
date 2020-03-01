ZSH=/usr/share/oh-my-zsh/

ZSH_THEME=""

DISABLE_AUTO_UPDATE="true"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
alias vim='nvim'

# Npm install directory
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$(manpath)"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

plugins=(zsh-autosuggestions)
