#!/bin/bash

# Install the configuration files into the files
# required by each application.
# Add any new files here.

SCRDIR="$(readlink -f $(dirname "$0"))"

CP_FLAGS="-i"  # default cp options

function showHelp () {
	echo "Usage: $0 [-h|--help] [-f]"
	echo "Installs configuration files into the user locations."
	echo
	echo "Flags:"
	echo -e "\t-h, --help: show this help message."
	echo -e "\t-f: do not ask for confirmation when overwriting a file."
	exit 0
}

FORCE=0
HELP=0
while [ $# -gt 0 ]; do
	[ "$1" == "-f" ] && FORCE=1
	[ "$1" == "-h" ] && HELP=1
	[ "$1" == "--help" ] && HELP=1
	shift
done

if [ "$HELP" -gt 0 ]; then
	showHelp
fi

if [ "$FORCE" -gt 0 ]; then
	CP_FLAGS="-fv"
fi

# bash
echo "Skipping .bashrc, add manually if you like with:"
echo -e "\t"'cp "$CP_FLAGS" "$SCRDIR/bash/.bashrc" "$HOME/.bashrc"'

# cp "$CP_FLAGS" "$SCRDIR/bash/.bashrc" "$HOME/.bashrc"

# tmux
cp "$CP_FLAGS" "$SCRDIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# i3
"$SCRDIR/i3/install.sh"
"$SCRDIR/X/install.sh"

