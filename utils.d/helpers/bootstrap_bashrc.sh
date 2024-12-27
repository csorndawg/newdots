#!/usr/bin/env bash

##
## VARS
##
BASHRC_PATH="$HOME/.bashrc"

##
## FUNCTIONS
##

# backup bashrc before overwriting with dotfile symlink
function smart_bashrc_symlink {

	# handle func args
	BASHRC_PATH_ARG="$1"

	# capture file description char
	LSLA_FIRST_CHAR="$(ls -la \"$BASHRC_PATH_ARG\" | egrep '\.bashrc\b' | cut --characters=1)"
	echo "LSLA_FIRST_CHAR: $LSLA_FIRST_CHAR"

	# case statement to handle diff types
	echo ""
	case $LSLA_FIRST_CHAR in

	# symlink
	l)
		echo "Bashrc symlink exists, and will not be overwritten"
		;;

	# file
	-)
		echo "Bashrc file exists, and will be backed up before being overwritten by dotfiles symlink"
		;;

	# other
	*)
		echo "Error, unexpected character received"
		exit 0
		;;
	esac
}

##
## MAIN
##

# check if file or symlink exists for BASHRC
if [[ -L "$BASHRC_PATH" ]] || [[ -f "$BASHRC_PATH" ]]; then
	echo "BASHRC exists on system as a file or symlink"
	smart_bashrc_symlink $BASHRC_PATH
	echo ""
	echo "Done with bashrc symlinks"
fi
