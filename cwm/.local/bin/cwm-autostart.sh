#!/usr/bin/env bash

# CWM - calm window manager autostart file

# Export XDG desktop session
export XDG_CURRENT_DESKTOP='cwm'

# Enable super keys for menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Fix cursor
xsetroot -cursor_name left_ptr

# Start Polybar
~/.config/polybar/launch.sh &

# xrandr scaling reference
#
# 125% = 1.6x1.6
# 133% = 1.5x1.5
# 150% = 1.33333333x1.33333333
# 160% = 1.25x1.25
# 175% = 1.14285714x1.14285714
#
# Set display scaling (using xrandr) 
#xrandr --output HDMI-A-0 --scale 1.14285714x1.14285714 &

# Start XDG autostart .desktop files (using dex)
dex --autostart --environment cwm &

# Start xss-lock and set dpms time to trigger xss-lock
xss-lock -l -- i3lock -n -c 202a36 &
sleep 1; xset dpms 300 300 300 &

# Start polkit authentication agent
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Start dunst for notifications
dunst &

# Set wallpaper with nitrogen
sleep 0.75; nitrogen --restore &

# Start xbindkeys to mod keybindings
xbindkeys &

# Start AT-SPI D-Bus Bus
/usr/lib/at-spi-bus-launcher --launch-immediately &
