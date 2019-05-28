#!/usr/bin/env bash

# Terminate already running xautolock instances
killall -q xautolock

# Wait until the processes have been shut down
while pgrep -u $UID -x xautolock >/dev/null; do sleep 1; done

# Just assume $1 is a number
xautolock -time $1 -locker "$HOME/.config/i3/i3exit lock" -secure -detectsleep &

# could also use -notify 3000 (5 minutes for example) and -notifier <dim_screen_script> to dim the screen before locking.
# But then I should also have a way to brighten the screen again.
