# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers:$HOME/.local/bin/tools:$HOME/.local/bin/wm:$HOME/.local/bin/polybar:$HOME/.local/bin/jobs
PATH=$PATH:$HOME/python_scripts:$HOME/bash_scripts

export PATH

# Default Terminal
export TERMINAL=st

# Default editor
export EDITOR=vim

# Default browser
export BROWSER=firefox

export SUDO_ASKPASS=dmenupass

# Auto start X on tty1
if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx
fi
