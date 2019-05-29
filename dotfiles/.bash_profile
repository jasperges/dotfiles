# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/bin/launchers:$HOME/.local/bin/tools:$HOME/.local/bin/wm
PATH=$PATH:$HOME/python_scripts:$HOME/bash_scripts

# set PATH to include yarn installed binaries
if [ -d "$HOME/.yarn/bin" ]; then
    PATH="$HOME/.yarn/bin:$PATH"
fi

export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/bin/visualsfm:$HOME/bin/meshlab
export LD_LIBRARY_PATH

# Deadline
export DEADLINE_PATH=/opt/Thinkbox/Deadline10

# Default Terminal
export TERMINAL=st

# Default editor
export EDITOR=vim

# Default browser
export BROWSER=firefox

export SUDO_ASKPASS=dmenupass
