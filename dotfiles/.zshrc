# jasperges config for the z shell
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U colors && colors

# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
# Load functions if existent.
[ -f "$HOME/.functionrc" ] && source "$HOME/.functionrc"

# Completion
fpath+=("$HOME/.zsh/completion")

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
            echo -ne '\e[2 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
            echo -ne '\e[6 q'
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

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# Source global definitions
[ -f /etc/zshrc ] && source /etc/zshrc

[ -f "$HOME/.config/user-dirs.dirs" ] && source "$HOME/.config/user-dirs.dirs"

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

# virtualenvwrapper
if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

# rez
if [ -f /opt/rez/completion/complete.zsh ]; then
    . /opt/rez/completion/complete.zsh
fi

# broot
if [ -f $HOME/.config/broot/launcher/bash/br ]; then
    . $HOME/.config/broot/launcher/bash/br
fi

# dir colors
if [ -f $HOME/.dircolors ]; then
    eval $(dircolors $HOME/.dircolors)
fi

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1="%B%{$fg[blue]%}[%n@%m %{$fg[yellow]%}%~%{$fg[blue]%}]$ %{$reset_color%}"
PS1="%B[%{$fg[blue]%}%n%{$reset_color%}%B@%{$fg[yellow]%}%m %{$fg[green]%}%~%{$reset_color%}%B]$ %{$reset_color%}"

# Pure prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL='>>'
PURE_PROMPT_VICMD_SYMBOL='<<'
# PURE_PROMPT_SYMBOL='♫'
prompt pure
# prompt_newline='%666v'
PROMPT=" $PROMPT"

# Load fast-syntax-highlighting; should be last.
source /home/jasperge/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

#  vim: set ts=4 sw=4 tw=4 et :
