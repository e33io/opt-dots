# .profile for openSUSE Linux

test -z "$PROFILEREAD" && . /etc/profile || true

# Fix DBus errors
export NO_AT_BRIDGE=1

# Load ~/.Xresources
xrdb ~/.Xresources &

# Set Qt HiDPI scaling
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96

# Set Qt theming
export QT_QPA_PLATFORMTHEME=qt5ct
