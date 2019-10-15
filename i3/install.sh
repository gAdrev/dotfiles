#!/bin/bash

# Install the configuration files into the files
# required by each application.
# Add any new files here.

SCRDIR="$(readlink -f $(dirname "$0"))"

CP_FLAGS="-vi"  # default cp options

cp $CP_FLAGS "$SCRDIR/config" "$HOME/.config/i3/config"
cp $CP_FLAGS "$SCRDIR/.i3status.conf" "$HOME/.i3status.conf"

