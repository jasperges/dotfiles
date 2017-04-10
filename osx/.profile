export DISABLE_AUTO_TITLE="true"

# export RMANTREE=/Applications/Pixar/RenderManProServer-20.2
# export RMANFB=$RMANTREE/../RenderManStudio-20.2-maya2015/bin/it.app

export PATH=${HOME}/src/arcanist/bin:usr/texbin:$PATH
export PATH=${HOME}/python_scripts:${HOME}/bash_scripts:$PATH
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH
export PATH=$RMANTREE/bin:$PATH

export PATH=/Applications/gaffer/bin:$PATH

export PYTHONPATH=${HOME}/src/singledispatch:${HOME}/src/unotools:$PYTHONPATH

# MacPorts Installer addition on 2013-01-11_at_16:02:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Golang options
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/src/go
export GOBIN=$GOPATH/bin

# Stalker
export STALKER_PATH=${HOME}/.strc

# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# VisualSFM
export PATH=${HOME}/src/VisualSFM_OS_X_Installer/vsfm/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/src/VisualSFM_OS_X_Installer/vsfm/bin

# Aliasses
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# clear
alias c='clear'

# Blender
alias blender='/Applications/blender.app/Contents/MacOS/blender --enable-new-depsgraph'
# alias blender='/Applications/blender.app/Contents/MacOS/blender'
alias b=blender
alias bc11='/Applications/blender-cxx11.app/Contents/MacOS/blender --enable-new-depsgraph'
alias bbb='/Applications/blender-buildbot/blender.app/Contents/MacOS/blender --enable-new-depsgraph'
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
alias ll='ls -l'
alias la='ls -lA'
alias llc='c; ll'
alias lac='c; la'

# Create parent dirs on demand
alias mkdir='mkdir -pv'

# Extra commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias todate='date +"%Y-%m-%d"'

# wget resume
alias wget='wget -c'

# du
# alias du='du -ch'


# rsync
alias rsync='rsync --exclude-from="~/.rsync_exclude"'

# for typos
alias gti='git'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
