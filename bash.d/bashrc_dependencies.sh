#!/bin/ bash

BASH_DOTFILES_HOME="$HOME/dotfiles/bash.d"

# conditional vars
SYMLINK_CHECK=$(ls -la $HOME | egrep "\.bashrc\b" | egrep -c '^l')
FILE_CHECK=$(ls -la $HOME | egrep "\.bashrc\b" | egrep -c '^-')
echo "SYMLINK_CHECK: $SYMLINK_CHECK"
echo "FILE_CHECK: $FILE_CHECK"

# dont overwrite existing bashrc symlink
if [ $SYMLINK_CHECK -ge 1 ]; then
	echo "bashrc symlink exists and will not be overwritten."
	exit 0

# if file (not symlink) exists backup before overwritting
elif [ $FILE_CHECK -ge 1 ]; then
	echo "Backing up current bashrc file before generating dotfile bashrc symlink"
	# back up existing bashrc file
	mv -vf "$HOME"/.bashrc{,.bk}
	ln -sr "$BASH_DOTFILES_HOME/bashrc_wsl" "$HOME/.bashrc" 2> /dev/null
## this should never execute
else
	exit 1
fi
