# User specific environment

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers\
:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/statusbar\
:$HOME/.local/bin/jobs:$HOME/.local/bin/go:$HOME/.local/bin/cargo/bin\
:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.poetry/bin\
:$HOME/.yarn/bin:/opt/Shotgun:/usr/local/DJV2/bin:/opt/rez/bin/rez\
:/opt/firefox:$PATH"

export PATH

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=nvim

# Default browser
export BROWSER=firefox
# export BROWSER=badwolf

# Notmuch config file
export NOTMUCH_CONFIG=$HOME/.config/notmuch/notmuch-config

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenu-pass

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

export REZ_CONFIG_FILE=$HOME/.config/rezconfig.py

# Paths for Go
export GOPATH=$HOME/.local/share/go
# At least for now put binaries in a separate bin/go directory
export GOBIN=$HOME/.local/bin/go

# Paths for Rust
export CARGO_HOME=$HOME/.local/share/cargo
# This means the binaries will end up in $HOME/.local/bin/cargo/bin
export CARGO_INSTALL_ROOT=$HOME/.local/bin/cargo
export RUSTUP_HOME=$HOME/.local/share/rustup

source "$HOME/.local/share/cargo/env"
