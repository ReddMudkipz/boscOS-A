if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export XDG_CURRENT_DESKTOP=GTK
export XDG_SESSION_TYPE=x11

dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# Start emacs daemon
emacs --daemon &

# Start dunst
dunst &

# Starts syncthing
syncthing &

# Start copyq, clipboard manager
copyq &

# Start flameshot daemon, to copy to clipboard
flameshot &

# For Bosco Room monitor configuration
xrandr --output DP-3 --left-of DP-1
xrandr --output DP-2 --rotate right

# For automounting usb-devices
udiskie &

# Start picom
picom &

exec dwm
