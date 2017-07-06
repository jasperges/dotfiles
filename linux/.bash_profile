# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:/usr/local/cuda/bin
PATH=$PATH:$HOME/src/arcanist/bin
PATH=$PATH:$HOME/python_scripts:$HOME/bash_scripts
PATH=$PATH:$HOME/bin/visualsfm:$HOME/bin/meshlab:$HOME/bin/openMVG:$HOME/bin/openMVS
export PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/bin/visualsfm:$HOME/bin/meshlab
export LD_LIBRARY_PATH
# CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/NVIDIA_CUDA-8.0_Samples/common/inc
# export CPLUS_INCLUDE_PATH

# Stalker
export STALKER_PATH=$HOME/.strc
