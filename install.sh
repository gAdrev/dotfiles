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
cp "$CP_FLAGS" "$SCRDIR/bash/.bashrc" "$HOME/.bashrc"

# tmux
cp "$CP_FLAGS" "$SCRDIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# vim
if [ -d "$HOME/.vim" ]; then
	cp "$CP_FLAGS" "$SCRDIR/vim/vimrc" "$HOME/.vim/vimrc"

	# vim8 packages: .vim/pack/<category>/{opt,start} folders
	# the pull script at pack should set up evreything
	mkdir -p "$HOME/.vim/pack"
	cp "$CP_FLAGS" "$SCRDIR/vim/pack/pull.sh" "$HOME/.vim/pack/pull.sh"
fi

# i3
"$SCRDIR/i3/install.sh"

