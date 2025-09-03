#!/usr/bin/env bash

# =============================================================================
# Move active window to center of screen
# -----------------------------------------------------------------------------
# For Xfce, copy file to `/usr/bin` and add `/usr/bin/move-window-center.sh`
# to: Settings > Keyboard > Application Shortcuts
# =============================================================================

IFS='x' read screenWidth screenHeight < <(xdpyinfo | grep dimensions | grep -o '[0-9x]*' | head -n1)

width=$(xdotool getactivewindow getwindowgeometry --shell | head -4 | tail -1 | sed 's/[^0-9]*//')
height=$(xdotool getactivewindow getwindowgeometry --shell | head -5 | tail -1 | sed 's/[^0-9]*//')

newPosX=$((screenWidth/2-width/2))
newPosY=$((screenHeight/2-height/2))

xdotool getactivewindow windowmove "$newPosX" "$newPosY"
