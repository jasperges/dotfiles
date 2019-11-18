# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f "$HOME/.config/user-dirs.dirs" ]; then
        . "$HOME/.config/user-dirs.dirs"
fi

export XDG_CONFIG_HOME=$HOME/.config

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# User specified aliases and functions

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_functions" ]; then
    . "$HOME/.bash_functions"
fi

# fuzzy finder
if [ -f "$HOME/.fzf.bash" ]; then
    . "$HOME/.fzf.bash"
fi

# enable globstar
shopt -s globstar

# use a vi-style line editing interface
set -o vi
