# .bash_profile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/polybar:$HOME/.local/bin/jobs:$HOME/.poetry/bin

export PATH

# Default Terminal
export TERMINAL=alacritty

# Default editor
export EDITOR=nvim

# Default browser
export BROWSER=firefox

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenupass

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

export REZ_CONFIG_FILE=$HOME/.config/rezrc
export ALLZPARK_CONFIG_FILE=$HOME/.config/allzparkrc

# Auto start X on tty1
if [[ -z ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx 2>/dev/null 1>&2
fi

if [[ -n ${DISPLAY} ]]; then
    # Add non-network connections to access control list
    xhost + local:
fi

# Make directories and files completely private by default
umask 0077
