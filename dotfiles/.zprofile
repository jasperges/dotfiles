# .bash_profile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# User specific environment and startup programs

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers\
:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/statusbar\
:$HOME/.local/bin/jobs:$HOME/.config/yarn/global/node_modules/.bin\
:$HOME/.poetry/bin:$HOME/.yarn/bin:/opt/Shotgun:/usr/local/DJV2/bin\
:/opt/rez/bin/rez:/opt/firefox:$PATH"

export PATH

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=nvim

# Default browser
export BROWSER=firefox

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenu-pass

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

export REZ_CONFIG_FILE=$HOME/.config/rezconfig.py

# These should be set by the relevant rez packages themselves.
# export ALLZPARK_CONFIG_FILE=$HOME/.config/allzparkconfig.py
# export TORPEDO_CONFIG_FILE=$HOME/.config/torpedoconfig.py

# Auto start X on tty1
if [[ -z ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx 2>/dev/null 1>&2
    # exec startx 2>$HOME/startx.log 1>&2
fi

if [[ -n ${DISPLAY} ]]; then
    # Add non-network connections to access control list
    xhost + local:
fi

# Make directories and files completely private by default
# umask 0077
