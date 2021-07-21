# User specific environment

# Config directory for zsh
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=vim

# Default browser
export BROWSER=firefox

# Notmuch config file
export NOTMUCH_CONFIG=$HOME/.config/notmuch/notmuch-config

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenu-pass

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Textwidth for htitle
export HRULEWIDTH=80

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY='$TERMINAL -t pinentry -e pinentry-curses "$@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

export REZ_CONFIG_FILE=$HOME/.config/rezconfig.py

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
