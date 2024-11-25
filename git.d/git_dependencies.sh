#!/bin/ bash

# @TODO - *** Update bashrc skeleton code for git dotfiles ***
# @TODO - Add `gh` auth login and repo cloning logic to this later. As of now only covering gitconfig/gitignore.

# Create XDG_CONFIG dir and symlink git-related dotfiles


GIT_DOTFILES_HOME="$HOME/dotfiles/git.d"

# exit if dotfile bashrc symlink is active
# SYMLINK_FILES=(gitignore gitconfig)

# @FIXME - logic needs to be fixed 
for git_symlink in $(find $GIT_DOTFILES_HOME -type f); do
	for SYML_PATTERN in ${SYMLINK_FILES[@]}; do
		isMatch=$(echo $git_symlink | egrep -cv "$SYML_PATTERN" | bc)
		if [ $isMatch -ge 1 ]; then
			echo "Match found for $SYML_PATTERN with $git_symlink"
			echo "Making symlink b/w above 2"
			break
		fi
	done
done



# <PERFORM SYMLINK_CHECK for each `file` in $SYMLINK_FILES and make symlink if DNE>		# <<<-------- @TODO
#
#echo "SYMLINK_CHECK: $SYMLINK_CHECK"
#if [ $SYMLINK_CHECK -ge 1 ]; then
#	echo "Current bashrc file is already symlinked to dotfiles bashrc"
#	exit 0
#fi

# make symlink 
#ln -sr "$BASH_DOTFILES_HOME/bashrc_wsl" "$HOME/.bashrc" 2> /dev/null
