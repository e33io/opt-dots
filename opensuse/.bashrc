# .bashrc for openSUSE Linux

test -s ~/.alias && . ~/.alias || true

# Set editor
export EDITOR="micro"
export VISUAL="micro"

# Set command prompt
PS1='\[\e[02;37m\][\[\e[m\]\[\e[01;34m\]\w\[\e[m\]\[\e[02;37m\]]\[\e[m\]\[\e[01;32m\]$\[\e[m\] '

# Set terminal title
PS1="\[\e]0;\w\a\]$PS1"

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Set fzf command to include hidden files and dirs
export FZF_DEFAULT_COMMAND="find . -printf '%P\n'"

# Aliases to reboot and power off
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

# Alias to select wifi connection
alias wifi='nmtui connect'

# Remove list of recently used files
alias remove-recent='rm -Rf ~/.local/share/recently-used.xbel'

# Strip exif metadata from images, usage: strip-images path-to-file-or-directory
alias strip-images='exiftool -overwrite_original -recurse -all= -TagsFromFile @ -ColorSpaceTags'

# Create new note file with timestamped file name
alias new-note='micro "$HOME/Documents/note_$(date +"%m-%d-%y_%H-%M-%S").txt"'
