# .bash_profile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/polybar:$HOME/.local/bin/jobs:$HOME/.local/rez/bin:

if [ -d /opt/Shotgun ]; then
    PATH=$PATH:/opt/Shotgun
fi

if [ -d $HOME/.yarn/bin ]; then
    PATH=$PATH:$HOME/.yarn/bin
fi

export PATH

# Default Terminal
export TERMINAL=st

# Default editor
export EDITOR=nvim

# Default browser
# Temporary until the digital cert bug gets fixed
export BROWSER=firefox_

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenupass

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

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
