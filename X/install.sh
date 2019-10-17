#!/bin/bash

# Install the configuration files into the files
# required by each application.
# Add any new files here.

SCRDIR="$(readlink -f $(dirname "$0"))"

CP_FLAGS="-vi"  # default cp options

cp $CP_FLAGS "$SCRDIR/.Xresources" "$HOME/.Xresources"
cp $CP_FLAGS "$SCRDIR/.xprofile" "$HOME/.xprofile"
if [ -d "$HOME/bin" ]
then
    cp $CP_FLAGS "$SCRDIR/reposition_workspaces.sh" "$HOME/bin/"
fi

