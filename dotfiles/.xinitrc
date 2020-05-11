#!/bin/sh

# Load xresources
xrdb ~/.Xresources

# Restore last used backlight values
[[ -f $HOME/.last_screen_backlight ]] && cat $HOME/.last_screen_backlight > "/sys/class/backlight/gmux_backlight/brightness"
[[ -f $HOME/.last_keyboard_backlight ]] && cat $HOME/.last_keyboard_backlight > "/sys/class/leds/smc::kbd_backlight/brightness"

# Simple X Hot Key Daemon
sxhkd_run &

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
killall -wq autolock; autolock 9 &

# Start mpd
killall -wq mpd; mpd &

# Start X compositor, notification and set wallpaper
killall -wq picom; picom --experimental-backends &
killall -wq dunst; dunst &
feh --bg-fill $HOME/pictures/backgrounds/active_wallpaper

# Start apps that show in tray area
dropbox_run &
protonmailbridge_run &
# syncthing-gtk --minimized &
killall -wq syncthing; syncthing -no-browser &
# nmapplet_run &
bluemanapplet_run &

# Set locale as I want
localectl set-locale LANG=en_US.UTF-8 LC_MONETARY=nl_NL.UTF-8 \
                          LC_PAPER=nl_NL.UTF-8 LC_MEASUREMENT=nl_NL.UTF-8 LC_TIME=en_US.UTF-8 \
                          LC_NUMERIC=en_US.UTF-8

start_spectrwm() {
    exec spectrwm
}

start_dwm() {
    killall -qw dwmblocks
    dwmblocks &
    exec dwm
}

start_dwm

# vim: set ts=4 sw=4 tw=0 et ft=sh:
