#!/bin bash

# variables
DOTFILES_VIM_DIR="$HOME/dotfiles/vim.d"
VIM_SYMLINK_PATTERNS=(vim vimrc)

# make dirs dependencies

for x in ${VIM_SYMLINK_PATTERNS[@]}; do
	echo "x: $x"
	SYMLINK_CHECK=$(ls -la $HOME | egrep "\.$x\b" | egrep -c "^l")
	if [ $SYMLINK_CHECK -ge 1 ]; then
		echo "Current symlink target $x already exists, and will be skipped."
		continue
	fi
	
	# otherwise symlink needs to be created
	ln -
done


