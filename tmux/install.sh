#!/bin/bash

# Install the configuration files into the files
# required by each application.
# Add any new files here.

SCRDIR="$(readlink -f $(dirname "$0"))"

CP_FLAGS="-vi"  # default cp options

cp $CP_FLAGS "$SCRDIR/.tmux.conf" "$HOME/.tmux.conf"

