#!/usr/bin/env bash

# Polybar module setup:
#   [module/active-window]
#   type = custom/script
#   exec = active-window.sh
#   tail = true

interval=1
maxlen=140

escape_polybar() {
  # Make sure Polybar doesn't parse formatting:
  # - '%'  -> '%%'   (prevents "%{" starting a tag)
  # - '{'  -> '\{'
  # - '}'  -> '\}'
  printf '%s' "$1" | sed -e 's/%/%%/g' -e 's/{/\\{/g' -e 's/}/\\}/g'
}

while true; do
    # Get active window ID
    win_id=$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | awk '{print $NF}')

    if [ -z "$win_id" ] || [ "$win_id" = "0x0" ]; then
        title=""
    else
        # Get title from _NET_WM_NAME (modern)
        title=$(xprop -id "$win_id" _NET_WM_NAME 2>/dev/null | sed -n 's/.*= "\(.*\)"/\1/p')

        # Fallback to WM_NAME (legacy)
        if [ -z "$title" ]; then
            title=$(xprop -id "$win_id" WM_NAME 2>/dev/null | sed -n 's/.*= "\(.*\)"/\1/p')
        fi

        # Ignore polybar itself
        [ "$title" = "polybar" ] && title=""
    fi

    # Truncate if longer than $maxlen
    if [ -n "$title" ] && [ "${#title}" -gt "$maxlen" ]; then
        title="${title:0:$maxlen}…"
    fi

    # Escape before printing
    title=$(escape_polybar "$title")

    echo "$title"
    sleep "$interval"
done
