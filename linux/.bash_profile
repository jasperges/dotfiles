# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:$HOME/python_scripts:$HOME/bash_scripts

export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/bin/visualsfm:$HOME/bin/meshlab
export LD_LIBRARY_PATH

# Stalker
export STALKER_PATH=$HOME/.strc

# Deadline
export DEADLINE_PATH=/opt/Thinkbox/Deadline10
