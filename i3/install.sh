#!/bin/bash

# Install the configuration files into the files
# required by each application.
# Add any new files here.

SCRDIR="$(readlink -f "$(dirname "$0")")"

CP_FLAGS="-vi"  # default cp options

genconfig() {
    SECONDARY_NAME=$(xrandr | grep " connected" | grep -v primary | cut -d' ' -f1)
    if [ -z "$SECONDARY_NAME" ]; then
        SECONDARY_NAME=primary
    fi

    TEMP_CONFIG="$(mktemp)"
    cat <<EOF >"$TEMP_CONFIG"
workspace 1 output primary
workspace 2 output "$SECONDARY_NAME"
workspace 3 output primary
workspace 4 output "$SECONDARY_NAME"
workspace 5 output primary
workspace 6 output "$SECONDARY_NAME"
workspace 7 output primary
workspace 8 output "$SECONDARY_NAME"
workspace 9 output primary
workspace 10 output "$SECONDARY_NAME"
EOF
    cat "$SCRDIR/config" "$TEMP_CONFIG" > "$SCRDIR/config.gen"
}

genconfig
cp $CP_FLAGS "$SCRDIR/config.gen" "$HOME/.config/i3/config"

cp $CP_FLAGS "$SCRDIR/.i3status.conf" "$HOME/.i3status.conf"

