#!/bin/sh
xset s off -dpms & # Disaables screen blanking

xsetroot -solid black & # Sets background to black. Fixes afterimage issue when moving windows

# Status bar
slstatus &

# Syncthing daemon
syncthing &

# xbindkeys daemon for HUGE custom binds
xbindkeys &

# Set HUGE mouse speed
xinput --set-prop "pointer:Getech HUGE TrackBall" "Coordinate Transformation Matrix" 2, 0.0, 0.0, 0.0, 2, 0.0, 0.0, 0.0, 1.0 &
xinput --set-prop "pointer:Getech HUGE TrackBall" "libinput Accel Speed" 0 &

# Set Logitech MX Ergo Multi-Device Trackball mouse speed
xinput --set-prop "Logitech MX Ergo Multi-Device Trackball " "Coordinate Transformation Matrix" 2, 0.0, 0.0, 0.0, 2, 0.0, 0.0, 0.0, 1.0 &
xinput --set-prop "Logitech MX Ergo Multi-Device Trackball " "libinput Accel Speed" 0 &

# Set T440s trackpad
xinput --set-prop "Synaptics TM3053-003" "Coordinate Transformation Matrix" 1.5, 0.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0, 1.0 &
xinput --set-prop "Synaptics TM3053-003" "libinput Accel Speed" 0 &

# Set TrackPoint mouse speed
xinput --set-prop "TPPS/2 IBM TrackPoint" "Coordinate Transformation Matrix" 0.3, 0.0, 0.0, 0.0, 0.3, 0.0, 0.0, 0.0, 1.0 &
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0 &

# Set Trackpad natural scrolling
xinput --set-prop "Synaptics TM3053-003" "libinput Natural Scrolling Enabled" 1 &
