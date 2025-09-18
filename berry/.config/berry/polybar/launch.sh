#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using custom config location
echo "---" | tee -a /tmp/polybar.log
polybar -c $HOME/.config/berry/polybar/config.ini mainbar 2>&1 \
| tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
