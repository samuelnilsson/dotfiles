# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/samuel/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

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
if is_set "$NAS_USERNAME" && is_set "$NAS_HOST" && is_set "$NAS_SSH_PORT"; then
	alias htpc='ssh $NAS_USERNAME@$NAS_HOST -p $NAS_SSH_PORT'
fi

# Color exports
alias grep='grep --color=auto'

# Color aliases
alias ls='ls --color=always'

# Prompt
#-------------------------------------------------
function git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

NEWLINE=$'\n'
PROMPT="%F{blue}[]%F{red}[%M]%F{yellow}[%n]%F{magenta}$(git_branch) %F{cyan}%~${NEWLINE}%F{white}﬌ "

# Npm install directory
#-------------------------------------------------
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH:$HOME/.dotnet/tools"
export MSBuildSDKsPath="/opt/dotnet/sdk/3.0.100/Sdks"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$HOME/.local/share/man:$(manpath)"
