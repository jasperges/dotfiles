# jasperges config for the z shell
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U colors && colors

# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
# Load functions if existent.
[ -f "$HOME/.functionrc" ] && source "$HOME/.functionrc"

setopt extendedglob
unsetopt beep

autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' menu select
zmodload zsh/complist

compinit

# Include hidden files in autocomplete
comp_options+=(globdots)

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
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

# fuzzy finder
if [ -f "$HOME/.fzf.zsh" ]; then
    . "$HOME/.fzf.zsh"
fi

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="%B%{$fg[blue]%}[%n@%m %{$fg[yellow]%}%~%{$fg[blue]%}]$ %{$reset_color%}"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
