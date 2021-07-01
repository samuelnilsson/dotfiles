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

export GOPATH="$HOME/go"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

plugins=(zsh-autosuggestions)

export ANDROID_SDK=/opt/cmdline-tools
export ANDROID_PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
export FLATPAK_PATH=/var/lib/flatpak/exports/bin
export PATH=$PATH:~/bin:$GOPATH/bin:/opt/flutter/bin:/opt/cmdline-tools/bin:$ANDROID_PATH:$FLATPAK_PATH

# Aliases for enabling wayland apps
alias mpv='mpv --gpu-context=wayland'
