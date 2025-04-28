# .bashrc for Fedora Linux

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Set command prompt
PS1='\[\e[02;37m\][\[\e[m\]\[\e[01;34m\]\w\[\e[m\]\[\e[02;37m\]]\[\e[m\]\[\e[01;32m\]$\[\e[m\] '

# Set terminal title
#PS1="\[\e]0;\w\a\]$PS1"

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Run fastfetch
alias neofetch='fastfetch'

# Strip exif metadata from images, usage: strip-images path-to-file-or-directory
alias strip-images='exiftool -overwrite_original -recurse -all= -TagsFromFile @ -ColorSpaceTags'
