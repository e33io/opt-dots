# .profile for Debian Linux

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include ~/.bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Set PATH to include user's private ~/bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set PATH to include user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Run X client utilities
if [ ! -t 0 ] ; then
    # Load ~/.Xresources
    xrdb ~/.Xresources &
fi

# Set Qt HiDPI scaling and theming
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96
export QT_QPA_PLATFORMTHEME=qt5ct
