# Add shortcuts file if it doesn't exist yet.
if [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ]; then
    shortcuts >/dev/null 2>&1 &
fi

# Auto start X on tty1
if [[ -z ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx 2>/dev/null 1>&2
    # exec startx 2>$HOME/startx.log 1>&2
fi

if [[ -n ${DISPLAY} ]]; then
    # Add non-network connections to access control list
    xhost + local:
fi

# Make directories and files completely private by default
# umask 0077
