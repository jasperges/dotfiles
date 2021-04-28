# User specific environment

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers\
:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/statusbar\
:$HOME/.local/bin/jobs:$HOME/.config/yarn/global/node_modules/.bin\
:$HOME/.poetry/bin:$HOME/.yarn/bin:/opt/Shotgun:/usr/local/DJV2/bin\
:/opt/rez/bin/rez:/opt/firefox:$PATH"

# Only add these to PATH if they exist

# for path in \
#     "$HOME/.config/yarn/global/node_modules/.bin" \
#     "$HOME/.poetry/bin" \
#     "$HOME/.yarn/bin" \
#     "/opt/Shotgun" \
#     "/usr/local/DJV2/bin" \
# do
#     [[ -d "$path" ]] && PATH="$PATH:$path"
# done

export PATH

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=nvim

# Default browser
export BROWSER=firefox
# export BROWSER=badwolf

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenu-pass

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

export REZ_CONFIG_FILE=$HOME/.config/rezconfig.py

# These should be set by the relevant rez packages themselves.
# export ALLZPARK_CONFIG_FILE=$HOME/.config/allzparkconfig.py
# export TORPEDO_CONFIG_FILE=$HOME/.config/torpedoconfig.py

source "$HOME/.cargo/env"
