#!/bin/ bash

BASH_DOTFILES_HOME="$HOME/dotfiles/bash.d"

# exit if dotfile bashrc symlink is active
SYMLINK_CHECK=$(ls -la $HOME | egrep "\.bashrc\b" | egrep -c "^l")
echo "SYMLINK_CHECK: $SYMLINK_CHECK"
if [ $SYMLINK_CHECK -ge 1 ]; then
	echo "Current bashrc file is already symlinked to dotfiles bashrc"
	exit 0
fi

# make symlink 
ln -sr "$BASH_DOTFILES_HOME/bashrc_wsl" "$HOME/.bashrc" 2> /dev/null
