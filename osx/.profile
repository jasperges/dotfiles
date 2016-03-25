#MAYA_LOCATION=/Applications/Autodesk/maya2015/Maya.app/Contents
#export MAYA_LOCATION

export RMANTREE=/Applications/Pixar/RenderManProServer-20.2
# export RMANFB=$RMANTREE/../RenderManStudio-20.2-maya2015/bin/it.app

#export PATH=/Users/jasperge/src/arcanist/bin:$MAYA_LOCATION/bin:/usr/texbin:$PATH
export PATH=/Users/jasperge/src/arcanist/bin:usr/texbin:$PATH
export PATH=/Users/jasperge/python_scripts:/Users/jasperge/bash_scripts:$PATH
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH
export PATH=$RMANTREE/bin:$PATH

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/local/bin/python3
source /opt/local/Library/Frameworks/Python.framework/Versions/3.4/bin/virtualenvwrapper.sh

export PYTHONPATH="/Users/jasperge/src/singledispatch:/Users/jasperge/src/unotools:$PYTHONPATH"

# MacPorts Installer addition on 2013-01-11_at_16:02:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Aliasses

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# clear
alias c='clear'

# port
# alias port='sudo port'

# Blender
alias blender='/Applications/blender.app/Contents/MacOS/blender'
alias b=blender
alias bf-blender='/Applications/bf-blender/blender.app/Contents/MacOS/blender'
alias bfb=bf-blender
alias bu='~/bash_scripts/blenderUpdate.sh'

#MacPorts
alias pu='~/bash_scripts/portUpdate.sh'

# cd aliasses
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# ls
alias ls='ls -G'
alias ll='ls -la'
alias la='ls -a'
alias llc='c; ll'

# Create parent dirs on demand
alias mkdir='mkdir -pv'

# Extra commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias date='date +"%d-%m-%Y"'

# wget resume
alias wget='wget -c'

# du
alias du='du -ch'

# wake on lan
alias wakez600='wakeonlan 2c:27:d7:3b:7a:f4'
alias waker2='wakeonlan 00:1f:29:00:94:7e'
alias waker3='wakeonlan 00:1f:29:01:c5:77'
alias waker4='wakeonlan 00:1f:29:01:a5:ff'
alias waker5='wakeonlan 00:1f:29:00:4d:e1'

# rsync
alias rsync='rsync --exclude-form="/Users/jasperge/.rsync_exlcude"'
