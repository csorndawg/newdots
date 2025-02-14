#!/usr/bin/env bash

# Vars
CHEAT_CONFD_DIR="$HOME/.config/cheat"
CHEAT_CONF="conf.yml"
DOTFILE_CHEAT_CONF="$HOME/dotfiles/config.d/cheat/cheat.conf.yml"

if [ ! -d "$CHEAT_CONFD_DIR" ]; then
	echo "Making $CHEAT_CONFD_DIR"
	mkdir -p "$CHEAT_CONFD_DIR"
fi

function get_comm_cheatfiles() {

	#	if [ ! -d "$HOME/.config/cheat/cheatsheets/community" ]; then
	#		echo "Community cheatfiles missing. Installing now."
	#		spawn cheat
	#		#expect "A config file was not found. Would you like to create one now? [Y/n]:"
	#		expect "Would you like to create one now? [Y/n]:"
	#		send "Y\r"
	#		expect eof
	#
	#		echo "Starting init download"
	#	fi

	# @TODO: repeat for "cheatsheets/personal"
	if [ ! -d "$HOME/.config/cheat/cheatsheets/community" ]; then
		echo "Community cheatfiles missing. Installing now."
		yes | cheat
		echo "Finished init download"
	fi
}

# backup existing
if [ -f "$CHEAT_CONFD_DIR/$CHEAT_CONF" ]; then
	echo "Backing up current $CHEAT_CONF file"
	echo mv -v "$CHEAT_CONFD_DIR/$CHEAT_CONF"{,.bk}
	mv -v "$CHEAT_CONFD_DIR/$CHEAT_CONF"{,.bk}
fi

# ensure cheatfile config.yml dependencies present
get_comm_cheatfiles
find $CHEAT_CONFD_DIR
# make symlinks
if [ ! -z "$CHEAT_CONFD_DIR" ]; then
	echo ln -srf "$DOTFILE_CHEAT_CONF" "$CHEAT_CONFD_DIR/$CHEAT_CONF"
	ln -srf "$DOTFILE_CHEAT_CONF" "$CHEAT_CONFD_DIR/$CHEAT_CONF"
fi

# symlink version controlled cheatfiles to expected location on Users machine
CHEATFILE_VC_DIR="$HOME/git/cheatbook/cheat/cheatfiles"
for dir in $(find $CHEATFILE_VC_DIR -type d -maxdepth 1 -mindepth 1); do
	echo "dir: $dir"
	SUBDIR=$(basename "$dir")
	echo ln -sf "$dir" "$HOME/.cheat_$SUBDIR"
	ln -sf "$dir" "$HOME/.cheat_$SUBDIR"
done
