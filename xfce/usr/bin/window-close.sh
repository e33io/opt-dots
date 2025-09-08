#!/bin/sh

# =============================================================================
# Window close script for Xfce
# =============================================================================

set -eu

# Get currently focused window ID
wid=$(xdotool getwindowfocus)

# Exit if no focused window
[ -z "$wid" ] && exit 0

# Get WM_CLASS of the focused window
wm_class=$(xprop -id "$wid" WM_CLASS 2>/dev/null | awk -F '"' '{print $4}')

# Exit if WM_CLASS matches any in the ignore pattern
case "$wm_class" in
    Xfce4-panel|Xfdesktop)
        exit 0
        ;;
esac

# Close real application windows
[ -n "$wm_class" ] && xdotool windowclose "$wid"

exit 0
