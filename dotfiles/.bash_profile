# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# User specific environment and startup programs

# --------------------------- environment variables --------------------------

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=vim

# Default browser
export BROWSER=firefox

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenupass

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

# ----------------------------------- path -----------------------------------

pathappend() {
    local arg
    for arg in "$@"; do
        # Only add the path if it's an existing directory
        test -d "${arg}" || continue
        # Remove the path if it's in the middle of PATH
        PATH=${PATH//:${arg}:/:}
        # Remove the path if it's at the beginning of PATH
        PATH=${PATH/#${arg}:/}
        # Remove the path if it's at the end of PATH
        PATH=${PATH/%:${arg}/}
        # Add the path to the beginning of PATH
        export PATH="${PATH:+"${PATH}:"}${arg}"
    done
}

pathprepend() {
    local arg
    for arg in "$@"; do
        # Only add the path if it's an existing directory
        test -d "${arg}" || continue
        # Remove the path if it's in the middle of PATH
        PATH=${PATH//:${arg}:/:}
        # Remove the path if it's at the beginning of PATH
        PATH=${PATH/#${arg}:/}
        # Remove the path if it's at the end of PATH
        PATH=${PATH/%:${arg}/}
        # Add the path to the end of PATH
        export PATH="${arg}${PATH:+":${PATH}"}"
    done
}

# Default directory for custom scripts
export SCRIPTS=~/.local/bin/tools

# Remember last arg will be first in path
pathprepend \
    $HOME/.local/share/cargo/bin \
    $HOME/.local/bin/cargo/bin \
    $HOME/.local/bin/go \
    $HOME/.local/bin \
    $HOME/.local/bin/jobs \
    $HOME/.local/bin/launchers \
    $HOME/.local/bin/statusbar \
    $HOME/.local/bin/wm \
    $SCRIPTS


pathappend \
    $HOME/.config/yarn/global/node_modules/.bin \
    $HOME/.poetry/bin \
    $HOME/.yarn/bin \
    /opt/Shotgun \
    /usr/local/DJV2/bin \
    /opt/rez/bin/rez \
    /opt/firefox

# Paths for Go
export GOPATH=$HOME/.local/share/go
# At least for now put binaries in a separate bin/go directory
export GOBIN=$HOME/.local/bin/go

# Paths for Rust
export CARGO_HOME=$HOME/.local/share/cargo
# This means the binaries will end up in $HOME/.local/bin/cargo/bin
export CARGO_INSTALL_ROOT=$HOME/.local/bin/cargo
export RUSTUP_HOME=$HOME/.local/share/rustup


# Auto start X on tty1
if [[ -z ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx &>/dev/null
fi

if [[ -n ${DISPLAY} ]]; then
    # Add non-network connections to access control list
    xhost + local: &>/dev/null
fi

# Connect to tmux when logging in via ssh
if [[ -z $TMUX ]] && [[ -n $SSH_TTY ]]; then
    exec tmux new-session -A -s jasperge-session
fi

# Make directories and files completely private by default
# umask 0077
