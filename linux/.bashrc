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

# Blender
alias blender='~/blender/blender --enable-new-depsgraph'
# alias blender='/Applications/blender.app/Contents/MacOS/blender'
alias b=blender
alias bf-blender='~/bf-blender/blender.app/Contents/MacOS/blender'
alias bfb=bf-blender
alias bu='~/bash_scripts/blenderUpdateLinux.sh'

# cd aliasses
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# ls
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
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
# alias du='du -ch'


# rsync
alias rsync='rsync --exclude-from="~/.rsync_exclude"'

# for typos
alias gti='git'
