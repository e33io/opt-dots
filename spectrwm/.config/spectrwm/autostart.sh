#!/usr/bin/env bash

#### spectrwm autostart script ########################################

# Set xrandr scaling variables (percentage)
#x125="1.6x1.6"
#x133="1.5x1.5"
#x150="1.33333333x1.33333333"
#x160="1.25x1.25"
#x175="1.14285714x1.14285714"

# Set display scaling (using xrandr)
#xrandr --output HDMI-A-0 --scale $x175 &

# Start XDG autostart .desktop files (using dex)
dex --autostart --environment spectrwm &

# Start xss-lock and set dpms time to trigger xss-lock
xss-lock -l -- i3lock -n -c 202a36 &
sleep 1; xset dpms 300 300 300 &

# Start polkit authentication agent
/usr/libexec/polkit-mate-authentication-agent-1 &
#/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Start dunst for notifications
dunst &

# Set wallpaper with nitrogen
sleep 0.75; nitrogen --restore &

# Start xbindkeys to mod keybindings
#xbindkeys &

# Start at-spi d-bus
#/usr/lib/at-spi-bus-launcher --launch-immediately &
