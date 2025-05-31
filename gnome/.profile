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

# Set Qt platform theme with qgnomeplatform
export QT_QPA_PLATFORMTHEME=gnome

# Set Qt style with adwaita-qt, use Adwaita or Adwaita-Dark variants
export QT_STYLE_OVERRIDE=Adwaita-Dark
