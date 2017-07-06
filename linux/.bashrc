# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specified aliases and functions

# clear
alias c='clear'

# vim
alias vim='gvim -v'

# Blender
alias blender='~/blender/blender --enable-new-depsgraph'
alias b=blender
alias blender-buildbot='~/blender-buildbot/blender --enable-new-depsgraph'
alias bbb=blender-buildbot
alias b28='~/blender-2.80/blender'
alias bf-blender='~/bf-blender/blender'
alias bfb=bf-blender
alias bu='~/bash_scripts/blenderUpdate.sh'

# cd aliasses
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# ls
alias ll='ls -l --color=auto'
alias la='ls -lA --color=auto'
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
