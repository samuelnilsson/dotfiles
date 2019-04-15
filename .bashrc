#!/bin/bash

is_set() {
	if [ -z "$1" ]; then
		false
	else
		true
	fi
}

export PATH="$HOME/.local/bin:$PATH"

# If not running interactively, don't do anything
#-------------------------------------------------
[[ $- != *i* ]] && return

# Default text editor
#-------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'

# Set TERM
#-------------------------------------------------
export TERM='xterm-color'

# Ssh server aliases
#-------------------------------------------------
if is_set "$SERVER_USERNAME" && is_set "$SERVER_HOST" && is_set "$SERVER_SSH_PORT"; then
	alias server='ssh $SERVER_USERNAME@$SERVER_HOST -p $SERVER_SSH_PORT'
fi
if is_set "$HTPC_USERNAME" && is_set "$HTPC_HOST" && is_set "$HTPC_SSH_PORT"; then
	alias htpc='ssh $HTPC_USERNAME@$HTPC_HOST -p $HTPC_SSH_PORT'
fi

# Color exports
alias grep='grep --color=auto'

# Color aliases
alias ls='ls --color=always'

# Prompt
#-------------------------------------------------
git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1="\e[40;0;31m[\t]\e[40;0;34m[\h]\e[40;0;33m[\u]\e[40;0;35m\$(git_branch) \e[40;0;36m\w\e[40;0;37m\n\$ \[$RESET\]"

# Npm install directory
#-------------------------------------------------
mkdir -p "${HOME}/.npm-packages"
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
