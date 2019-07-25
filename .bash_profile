#!/bin/bash

is_set() {
	if [ -z "$1" ]
	then
		return 1
	else
		return 0
	fi
}

# Load environment variables
source ~/.bash_variables

# Git configuration
echo is_set $NAME
if is_set "$NAME"; then
	git config --global user.name "$NAME"
fi
if is_set "$EMAIL"; then
	git config --global user.email "$EMAIL"
fi

export ALSA_CARD=PCH

git config --global core.editor "nvim"
git config --global color.ui "true"

# Start sway
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	XKB_DEFAULT_LAYOUT=us exec sway
fi
