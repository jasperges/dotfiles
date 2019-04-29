# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specified aliases and functions

# open files
alias open='xdg-open'

# clear
alias c='clear'

# vim
alias vim='gvim -v'
alias vimpy2='vim --cmd "let py2 = 1"'

# Blender
alias b='$HOME/blender/blender'
alias blender-buildbot='$HOME/blender-buildbot/blender'
alias bbb=blender-buildbot
alias b28='$HOME/blender-2.80/blender'
alias bf-blender='$HOME/bf-blender/blender'
# alias bfb='bf-blender --enable-new-depsgraph'
alias blender='bf-blender'
alias bfb='bf-blender'
alias bu='$HOME/bash_scripts/blenderUpdate.sh'
alias downloadbbb27='blender_buildbot_download.py --extract'
alias downloadbbb='blender_buildbot_download.py --extract --blender-version 2.80'
alias bpip='$HOME/bf-blender/2.79/python/bin/pip3.5'
alias bpython='$HOME/bf-blender/2.79/python/bin/python3.5m'
alias bfm='$HOME/blender_fracture_modifier/blender'

# cd aliasses
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# ls
alias ls='ls -G --color=auto'
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
alias rsync='rsync --exclude-from="$HOME/.rsync_exclude"'

# for typos
alias gti='git'

# qt5
alias qmake='/usr/bin/qmake-qt5'

# ping
alias ping='ping -c 3'
