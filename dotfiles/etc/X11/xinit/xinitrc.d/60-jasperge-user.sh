# Load xresources
/usr/bin/xrdb ~/.Xresources &

# Simple X Hot Key Daemon
# /usr/bin/sxhkd &

# Disable extra screen (because of Intel chip?)
/home/jasperge/.local/bin/tools/setxrandr &

# Enable tapping, drag lock and natural scrolling
/home/jasperge/.local/bin/tools/setxinputs &

# Always turn on numlock
/usr/bin/numlockx on &

# Use Super_L on it's own as Escape
/usr/bin/xcape -e 'Super_L=Excape' &

# Turn on autolock
/home/jasperge/.local/bin/launchers/autolock 10 &

# Start mpd
/usr/bin/mpd &

# Start X compositor and notification daemon
/home/jasperge/.local/bin/launchers/compton_run &
/home/jasperge/.local/bin/launchers/dunst_run &

# Force locale to my wishes
/usr/bin/localectl set-locale LANG=en_US.UTF-8 LC_MONETARY=nl_NL.UTF-8 \
    LC_PAPER=nl_NL.UTF-8 LC_MEASUREMENT=nl_NL.UTF-8 LC_TIME=en_US.UTF-8 \
    LC_NUMERIC=en_US.UTF-8
