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

# Start picom
picom &

exec dwm
