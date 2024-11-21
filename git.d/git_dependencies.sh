#!/bin/ bash

# @TODO - *** Update bashrc skeleton code for git dotfiles ***
# @TODO - Add `gh` auth login and repo cloning logic to this later. As of now only covering gitconfig/gitignore.

# Create XDG_CONFIG dir and symlink git-related dotfiles


GIT_DOTFILES_HOME="$HOME/dotfiles/git.d"

# exit if dotfile bashrc symlink is active
# SYMLINK_FILES=(gitignore gitconfig)
##SYMLINK_CHECK=$(ls -la $HOME | egrep "\.git(ignore|config)\b" | egrep -c "^l")
#
# <PERFORM SYMLINK_CHECK for each `file` in $SYMLINK_FILES and make symlink if DNE>		# <<<-------- @TODO
#
#echo "SYMLINK_CHECK: $SYMLINK_CHECK"
#if [ $SYMLINK_CHECK -ge 1 ]; then
#	echo "Current bashrc file is already symlinked to dotfiles bashrc"
#	exit 0
#fi

# make symlink 
#ln -sr "$BASH_DOTFILES_HOME/bashrc_wsl" "$HOME/.bashrc" 2> /dev/null
