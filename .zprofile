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
# $NAME, $EMAIL
source ~/.zvariables

# Git configuration
if is_set "$NAME"; then
	git config --global user.name "$NAME"
fi
if is_set "$EMAIL"; then
	git config --global user.email "$EMAIL"
fi

git config --global core.editor "nvim"
git config --global color.ui "true"

# Use wayland apps
export MOZ_ENABLE_WAYLAND=1
export KITTY_ENABLE_WAYLAND=1
export BEMENU_BACKEND=wayland

# Start sway
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	XKB_DEFAULT_LAYOUT=us exec sway
fi
