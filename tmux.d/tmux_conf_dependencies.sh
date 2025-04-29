#!/bin/bash 

# Script symlinks tmux config folder from dotfile repo to local config. Has "tpm" dependency

# variables
TMUX_CONF_DIR="$HOME/.config/tmux"
TMUX_CONF_PLUGINS="$TMUX_CONF_DIR/plugins"
TMUX_SYML_SRC="$HOME/dotfiles/tmux.d"
TMUX_SYML_SRC="$HOME/git/newdots/tmux.d"  # tempfix

ln -sf "$TMUX_SYML_SRC" "$TMUX_CONF_DIR" || echo "Issue creating symlink between dotfiles tmux and local config"

if [ ! -d "$TMUX_CONF_PLUGINS" ]; then
	mkdir -pv "$TMUX_CONF_PLUGINS"
	
	# test cd
	echo "Current directory before cd: " $(pwd)
	cd $TMUX_CONF_PLUGINS
	echo "Current directory after cd: " $(pwd)
fi

# make clone 
if [[ ! -f "$TMUX_CONF_PLUGINS/tpm" ]]; then 
	echo "No tpm directory found, starting clone"
	git clone https://github.com/tmux-plugins/tpm  2> /dev/null 
fi

if [[ ! -z "$TMUX_SYML_SRC/tmux.d" ]]; then
	echo 'Remove duplicate/nested symlink'
	rm -v "$TMUX_SYML_SRC/tmux.d"  2> /dev/null
fi
