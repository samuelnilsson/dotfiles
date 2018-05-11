#!/bin/bash

is_set() {
	if [ -z "$1" ]; then
		false
	else
		true
	fi
}

# If not running interactively, don't do anything
#-------------------------------------------------
[[ $- != *i* ]] && return

# Default text editor
#-------------------------------------------------
export EDITOR=vim
export VISUAL=vim

# Ssh server aliases
#-------------------------------------------------
if is_set "$SERVER_USERNAME" && is_set "$SERVER_HOST" && is_set "$SERVER_SSH_PORT"; then
	alias server='ssh $SERVER_USERNAME@$SERVER_HOST -p $SERVER_SSH_PORT'
fi
if is_set "$HTPC_USERNAME" && is_set "$HTPC_HOST" && is_set "$HTPC_SSH_PORT"; then
	alias htpc='ssh $HTPC_USERNAME@$HTPC_HOST -p $HTPC_SSH_PORT'
fi

# Add colors to command output
#-------------------------------------------------

# Define colors (taken from https://gist.github.com/yuri91/4af6ac59fe7d31dd91fb)

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BASE03=$(tput setaf 234)
		BASE02=$(tput setaf 235)
		BASE01=$(tput setaf 240)
		BASE00=$(tput setaf 241)
		BASE0=$(tput setaf 244)
		BASE1=$(tput setaf 245)
		BASE2=$(tput setaf 254)
		BASE3=$(tput setaf 230)
		YELLOW=$(tput setaf 136)
		ORANGE=$(tput setaf 166)
		RED=$(tput setaf 160)
		MAGENTA=$(tput setaf 125)
		VIOLET=$(tput setaf 61)
		BLUE=$(tput setaf 33)
		CYAN=$(tput setaf 37)
		GREEN=$(tput setaf 64)
	else
		BASE03=$(tput setaf 8)
		BASE02=$(tput setaf 0)
		BASE01=$(tput setaf 10)
		BASE00=$(tput setaf 11)
		BASE0=$(tput setaf 12)
		BASE1=$(tput setaf 14)
		BASE2=$(tput setaf 7)
		BASE3=$(tput setaf 15)
		YELLOW=$(tput setaf 3)
		ORANGE=$(tput setaf 9)
		RED=$(tput setaf 1)
		MAGENTA=$(tput setaf 5)
		VIOLET=$(tput setaf 13)
		BLUE=$(tput setaf 4)
		CYAN=$(tput setaf 6)
		GREEN=$(tput setaf 2)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

# Color exports
export GREP_OPTIONS='--color=auto'

# Color aliases
alias ls='ls --color=always'

# Prompt
#-------------------------------------------------
git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1="\[$ORANGE\][\t]\[$BLUE\][\h]\[$GREEN\][\u]\[$YELLOW\]\$(git_branch) \[$CYAN\]\w\n\$ \[$RESET\]"
