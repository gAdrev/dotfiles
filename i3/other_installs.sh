#!/bin/bash

SCRDIR="$(readlink -f $(dirname "$0"))"

sudo cp -iv "$SCRDIR/exit_menu.sh" "/usr/local/bin/"
