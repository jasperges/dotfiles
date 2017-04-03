# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$HOME/src/arcanist/bin:$PATH
PATH=$HOME/python_scripts:$HOME/bash_scripts:$PATH

# Stalker
export STALKER_PATH=$HOME/.strc
