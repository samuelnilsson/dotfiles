#!/bin/bash

# Load environment variables
source ~/.bash_variables

# Git configuration
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global core.editor "vim"
git config --global color.ui "true"

# Start X if there is a display
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
