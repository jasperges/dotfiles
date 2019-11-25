# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/polybar:$HOME/.local/bin/jobs

export PATH

# Default Terminal
export TERMINAL=st

# Default editor
export EDITOR=vim

# Default browser
export BROWSER=firefox

[ -f $HOME/.fzf.bash ] && . $HOME/.fzf.bash

export SUDO_ASKPASS=$HOME/.local/bin/tools/dmenupass

# Use pinentry-curses in it's own floating terminal
# export PINENTRY_BINARY='st -n pinentry -e "pinentry-curses $@"'
# export PINENTRY_BINARY="pinentry-curses --ttyname pinentry"

# Auto start X on tty1
if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx 2>/dev/null 1>&2
fi

# Make directories and files completely private by default
umask 0077
