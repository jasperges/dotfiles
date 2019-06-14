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

# Start proper stuff when logging in with GDM
if [[ ${DISPLAY} ]]; then
    # Load xresources
    xrdb ~/.Xresources

    # Simple X Hot Key Daemon
    sxhkd &

    # Set up monitors
    setxrandr &

    # Enable tapping, drag lock and natural scrolling
    setxinputs &

    # Always turn on numlock
    numlockx on &

    # Tilde next to z key, also on laptop. This disables the section/plusminus key which I never use.
    xmodmap -e 'keycode 94 = grave asciitilde grave asciitilde dead_grave dead_horn dead_grave' &

    # Use Super_L on it's own as Escape
    xcape -e 'Super_L=Escape' &

    # Turn on autolock
    autolock 10 &

    # Start mpd
    mpd &

    # Start X compositor and notification daemon
    compton_run &
    dunst_run &

    # Set locale as I want
    localectl set-locale LANG=en_US.UTF-8 LC_MONETARY=nl_NL.UTF-8 \
        LC_PAPER=nl_NL.UTF-8 LC_MEASUREMENT=nl_NL.UTF-8 LC_TIME=en_US.UTF-8 \
        LC_NUMERIC=en_US.UTF-8

fi
