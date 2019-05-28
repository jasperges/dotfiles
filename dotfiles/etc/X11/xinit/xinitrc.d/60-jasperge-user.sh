# Load xresources
/usr/bin/xrdb ~/.Xresources

# Simple X Hot Key Daemon
# /usr/bin/sxhkd &

# Disable extra screen (because of Intel chip?)
/home/jasperge/.local/bin/tools/setxrandr

# Enable tapping, drag lock and natural scrolling
/home/jasperge/.local/bin/tools/setxinputs

# Always turn on numlock
/usr/bin/numlockx on

# Start mpd
/usr/bin/mpd

# Start X compositor and notification daemon
/usr/bin/compton &
/usr/bin/dunst &

# Force locale to my wishes
/usr/bin/localectl set-locale LANG=en_US.UTF-8
/usr/bin/localectl set-locale LC_MONETARY=nl_NL.UTF-8
/usr/bin/localectl set-locale LC_PAPER=nl_NL.UTF-8
/usr/bin/localectl set-locale LC_MEASUREMENT=nl_NL.UTF-8
/usr/bin/localectl set-locale LC_TIME=en_US.UTF-8
/usr/bin/localectl set-locale LC_NUMERIC=en_US.UTF-8
