# Load xresources
xrdb ~/.Xresources

# Simple X Hot Key Daemon
sxhkd &

# Disable extra screen (because of Intel chip?)
xrandr --output LVDS-1-1 --off

# Enable tapping, drag lock and natural scrolling
xinput set-prop 14 301 1
xinput set-prop 14 305 1
xinput set-prop 14 309 1

# Always turn on numlock
numlockx on

# Start mpd
mpd

# Start X compositor and notification daemon
compton &
dunst &

# Force locale to my wishes
localectl set-locale LANG=en_US.UTF-8
localectl set-locale LC_MONETARY=nl_NL.UTF-8
localectl set-locale LC_PAPER=nl_NL.UTF-8
localectl set-locale LC_MEASUREMENT=nl_NL.UTF-8
localectl set-locale LC_TIME=en_US.UTF-8
localectl set-locale LC_NUMERIC=en_US.UTF-8

i3
