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

# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
# Load functions if existent.
[ -f "$HOME/.functionrc" ] && source "$HOME/.functionrc"

# enable globstar
shopt -s globstar

# use a vi-style line editing interface
set -o vi

# fuzzy finder
if [ -f "$HOME/.fzf.bash" ]; then
    . "$HOME/.fzf.bash"
fi

source $HOME/.config/broot/launcher/bash/br
