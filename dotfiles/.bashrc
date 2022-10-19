# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc

[[ -f $HOME/.config/user-dirs.dirs ]] && source "$HOME/.config/user-dirs.dirs"

# Use beam shape cursor on startup.
[[ $- == *i* ]] && echo -ne '\e[5 q'

export XDG_CONFIG_HOME=$HOME/.config

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Load aliases and shortcuts if existent.
[[ -f $HOME/.aliasrc ]] && source "$HOME/.aliasrc"
# Load functions if existent.
[[ -f $HOME/.functionrc ]] && source "$HOME/.functionrc"

# enable globstar
shopt -s globstar

# use a vi-style line editing interface
set -o vi
# Change cursor shape for different vi modes.
# bind 'set show-mode-in-prompt on'
# bind 'set vi-cmd-mode-string "\1\e[2 q\2"'
# bind 'set vi-ins-mode-string "\1\e[6 q\2"'

# fuzzy finder
[[ -f $HOME/.fzf.bash ]] && source "$HOME/.fzf.bash"

# virtualenvwrapper
[[ -z $REZ_SHELL_INTERACTIVE ]] && [[ -f $HOME/.local/bin/virtualenvwrapper.sh ]] \
    && source "$HOME/.local/bin/virtualenvwrapper.sh"

# rez completion
# [[ -f /opt/rez/completion/complete.sh ]] && source /opt/rez/completion/complete.sh

# tea completion
PROG=tea source "/home/jasperge/.config/tea/autocomplete.sh"

# dir colors
[[ -f $HOME/.dircolors ]] && eval "$(dircolors "$HOME/.dircolors")"

# zsh like tab completion
# bind 'set show-all-if-ambiguous on'
# bind '"\C-i": menu-complete'

# colors for less
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0;37;102m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[4;32m")
export GROFF_NO_SGR=1 # For Konsole and Gnome-terminal

source "$HOME/.local/share/blesh/ble.sh"

[[ -z $REZ_SHELL_INTERACTIVE ]] && [[ -x $(command -v starship) ]] && eval "$(starship init bash)"

# zoxide
[[ -x $(command -v zoxide) ]] && eval "$(zoxide init bash)"
