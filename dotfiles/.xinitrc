#!/bin/bash

# Load xresources
xrdb ~/.Xresources

# Restore last used backlight values
if [[ -f $HOME/.last_screen_backlight ]]; then
    backlight_screen=$(cat $HOME/.last_screen_backlight)
    # Turn on the backlight slighty if it's (almost) off, else it might feel
    # that the display doesn't work
    (( backlight_screen < 5520 )) && backlight_screen=5520
    echo $backlight_screen > "/sys/class/backlight/gmux_backlight/brightness"
fi
if [[ -f $HOME/.last_keyboard_backlight ]]; then
    backlight_keyboard=$(cat $HOME/.last_keyboard_backlight)
    # Turn on the backlight slighty if it's (almost) off.
    (( backlight_keyboard < 12 )) && backlight_keyboard=12
    echo $backlight_keyboard > "/sys/class/leds/smc::kbd_backlight/brightness"
fi

# Simple X Hot Key Daemon
killall -wq sxhkd; sxhkd &

# Set up monitors
setxrandr &

# Enable tapping, drag lock and natural scrolling
setxinputs &

# Always turn on numlock
numlockx on &

# Tilde next to z key, also on laptop. This disables the section/plusminus key which I never use.
xmodmap -e 'keycode 94 = grave asciitilde grave asciitilde dead_grave dead_horn dead_grave' &

# Use Super_L on it's own as Escape
killall -wq xcape; xcape -e 'Super_L=Escape' &

# Turn on autolock
killall -wq xautolock; xautolock -time 9 \
    -locker $HOME/.local/bin/wm/jasperge-locker -secure -detectsleep &
# Lock screen on suspend etc.
killall -wq xss-lock; xss-lock -- $HOME/.local/bin/wm/jasperge-locker &

# Start mpd
killall -wq mpd; mpd &

# Start X compositor, notification and set wallpaper
killall -wq picom; picom --experimental-backends -b
killall -wq dunst; dunst &
$HOME/.fehbg &

# Start apps that show in tray area
killall -wq dropbox; dropbox start &
killall -wq protonmail-bridge; protonmail-bridge --no-window &
killall -wq syncthing; syncthing -no-browser &
# killall -wq nm-applet; nm-applet &
killall blueman-applet -wq; blueman-applet &

# Set locale as I want
localectl set-locale LANG=en_US.UTF-8 LC_MONETARY=nl_NL.UTF-8 \
    LC_PAPER=nl_NL.UTF-8 LC_MEASUREMENT=nl_NL.UTF-8 LC_TIME=en_US.UTF-8 \
    LC_NUMERIC=en_US.UTF-8

start_spectrwm() {
    exec spectrwm
}

start_dwm() {
    setup-monitor &
    killall -wq dwmblocks
    dwmblocks &
    exec dwm
}

start_dwm

# vim: set ts=4 sw=4 tw=0 et ft=sh:
