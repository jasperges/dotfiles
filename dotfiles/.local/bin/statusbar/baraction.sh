#!/bin/sh
# Statusbar line, it works at least for dwm and spectrwm

battery() {
    # discharging:           (100, 90, 80, 70, 60, 50, 40, 30, 20, 10)
    # charging:        (20, 30, 40, 60, 80, 90, 100)
    # unknown: 
    # full: 
    # Use `acpi`, because simply getting the capacity from
    # /sys/class/power_supply/BAT* does not take lowered capacity (due to age)
    # into account.
    capacity=$(acpi | cut -f2 -d ',' | tr -cd '[:digit:]')
    status=$(acpi | cut -f2 -d ':' | cut -f 1 -d ',' | tr -d '[:space:]')
    if [[ $status = "Full" ]]; then
        icon="+@fn=1;+@fn=0;"
    elif [[ $status = "Charging" ]]; then
        if [[ $capacity -lt 20 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 30 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 40 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 60 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 80 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 90 ]]; then
            icon="+@fn=1;+@fn=0;"
        else
            icon="+@fn=1;+@fn=0;"
        fi
    elif [[ $status = "Discharging" ]]; then
        if [[ $capacity -lt 10 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 20 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 30 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 40 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 50 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 60 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 70 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 80 ]]; then
            icon="+@fn=1;+@fn=0;"
        elif [[ $capacity -lt 90 ]]; then
            icon="+@fn=1;+@fn=0;"
        else
            icon="+@fn=1;+@fn=0;"
        fi
    else
        icon="+@fn=1;+@fn=0;"
    fi

	printf "%s%d%% " "$icon" "$capacity"
}

clock() {
    date '+%a %d %b - %H:%M'
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  printf "%d%%" "$cpu"
}

gpu() {
    nvidia-smi --query --display=memory | \
        awk -F ":" '\
        match($1, /^.*(FB|BAR1) Memory.*$/, c) {t=c[1]} \
        /Total|Used/ && t=="FB" && match($2, /([0-9]+ MiB)/, m) {a[++i]=m[1]} \
        END {printf a[2]"/"a[1]}'
}

hdd() {
  df -h | awk '/fedora00-home/{print $3"/"$2}'
}

internet() {
    # icons:
    #  - wifi up: 直
    #  - wifi down: 睊
    #  - ethernet up: 
    #  - ethernet down: 

    # WiFi
    grep -q "up" /sys/class/net/w*/operstate && wifiicon="+@fn=1;直+@fn=0;" \
        || wifiicon="+@fn=1;睊+@fn=0;"
    if [ "$wifiicon" = "+@fn=1;直+@fn=0;" ]; then
        activewifi=$(nmcli --terse -fields NAME,TYPE c show --active | \
            awk -F ':' '/wireless/ {printf $1}')
        wifisignal=$(nmcli --terse --fields SSID,SIGNAL d wifi list --rescan no | \
            awk -F ':' '/'"$activewifi"'/ {printf $2"%"}')
        wifiicon="$wifiicon $wifisignal"
    fi

    # Ethernet
    etherneticon="+@fn=1;$(sed 's/up//;s/down//' /sys/class/net/e*/operstate)+@fn=0;"

    printf "%s · %s" "$wifiicon" "$etherneticon"
}

pomodoro() {
    [ -f $HOME/.pomodoro_live ] && cat $HOME/.pomodoro_live 2>/dev/null | awk '{printf $1" "$2"   |   "}'
}

mail() {
    find ~/.local/share/mail/*/INBOX/new -type f 2>/dev/null | wc -l \
        | awk '{if ($1 > 0) {printf "+@fn=1;+@fn=0; " $1} else {printf "+@fn=1;+@fn=0; " $1}}'
}

mem() {
  free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'
}

mpd() {
    # icons:    栗
    status=$(mpc status | sed -n 's#^.*\(playing\|paused\|stopped\).*$#\1#p')
    current=$(mpc --format "%artist% - %title%" current | sed 's/^\(.\{30\}\).*/\1.../')
    case $status in
        "playing" ) printf "+@fn=1;+@fn=0; %s   |   " "$current" ;;
        "paused" ) printf "+@fn=1;+@fn=0; %s   |   " "$current" ;;
        'stopped' ) printf "+@fn=1;栗+@fn=0;   |   " ;;
    esac
}

vol() {
    # vol=$(amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }')
    # icons: 婢奄奔墳
    if [[ "$(systemctl status bluetooth | awk '/Active/ {printf $2'})" = "active" \
        && "$(bluetoothctl info 00:0A:45:0E:91:6E | awk '/Connected/ {print $2}')" = "yes" ]]; then
        extra_icon=" ()"
    else
        extra_icon=""
    fi
    vol=$(pulsemixer --get-volume | cut -d ' ' -f 1)
    mute=$(pulsemixer --get-mute)
    if [ $mute -gt 0 ]; then
        icon="婢"
    elif (( $vol < 33 )); then
        icon="奄"
    elif (( $vol < 66 )); then
        icon="奔"
    else
        icon="墳"
    fi
    printf "+@fn=1;$icon$extra_icon+@fn=0;   %d%%" "$vol"
}

vpn() {
    nmcli --terse --fields NAME,TYPE c show --active | head -n 1 \
        | awk -F ':' '{if ($2=="vpn") {printf "+@fn=1;+@fn=0;  " $1} else {printf "+@fn=1;+@fn=0;  No VPN"}}'
}

sep() {
    # Using 3 spaces make the separation more distinct
    printf "   |   "
}

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while true; do
    bartext="+@fn=0;$(clock)$(sep)$(pomodoro)$(mpd)+@fn=1;+@fn=0; $(cpu)$(sep)\
+@fn=1;+@fn=0; $(mem)$(sep)+@fn=1;+@fn=0; $(gpu)$(sep)+@fn=1;+@fn=0; $(hdd)\
$(sep)$(vol)$(sep)$(internet)$(sep)$(vpn)$(sep)$(mail)$(sep)$(battery)"

    # Even though the window manager might not be running at this point, this
    # is okay. It will try again every 5 seconds.
    case "$(wmctrl -m | awk '/Name/ {printf $2}')" in
        "spectrwm" )
            # echo "$(mpd)+@fn=1;+@fn=0; $(cpu)$(sep)+@fn=1;+@fn=0; $(mem)   \
# |   +@fn=1;+@fn=0; $(gpu)$(sep)+@fn=1;+@fn=0; $(hdd)$(sep)$(vol)   \
# |   $(internet)$(sep)$(vpn)$(sep)$(mail)$(sep)$(battery)"
            echo "$bartext"
            ;;
        "dwm" )
            xsetroot -name "$(echo "$bartext" | sed 's/\(+@fn=[0-9];\|+@fn=[0-9];\)//g')"
            ;;
        * ) echo "$bartext" | sed 's/\(+@fn=[0-9];\|+@fn=[0-9];\)//g'
    esac
	sleep $SLEEP_SEC
done
