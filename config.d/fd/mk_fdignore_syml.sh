#!/usr/bin/env bash

# VARS
DOTFILES_HOME_DIR="$HOME/dotfiles"
FD_CONFIGD_DIR="config.d/fd"
FDIGNORE_FNAME="fdignore"
FDIGNORE_PATH="$DOTFILES_HOME_DIR/$FD_CONFIGD_DIR/$FDIGNORE_FNAME"

# SYMLINK TARG
SYMLINK_TARG_PATH="$HOME/.fdignore"

#ln -sr $FDIGNORE_PATH $SYMLINK_TARG_PATH 2>/dev/null
echo ln -srf $FDIGNORE_PATH $SYMLINK_TARG_PATH # Overwrites existing symlink
ln -srf $FDIGNORE_PATH $SYMLINK_TARG_PATH      # Overwrites existing symlink
