#!/bin/bash

is_set() {
	if [ -z "$1" ]; then
		return 0
	else
		return 1
	fi
}

# Load environment variables
source ~/.bash_variables

export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_PREFER_DARK_THEME=1
export NVIM_GTK_NO_WINDOW_DECORATION=1

export PATH=$PATH:~/.gem/ruby/2.6.0/bin

# Git configuration
if is_set "$NAME"; then
	git config --global user.name "$NAME"
fi
if is_set "$EMAIL"; then
	git config --global user.email "$EMAIL"
fi
git config --global core.editor "vim"
git config --global color.ui "true"

# Start X if there is a display
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
