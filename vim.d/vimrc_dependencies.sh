#!/bin bash

# variables
DOTFILES_VIM_DIR="$HOME/dotfiles/vim.d"
VIM_SYMLINK_PATTERNS=(vim vimrc)

# make dirs dependencies

for x in ${VIM_SYMLINK_PATTERNS[@]}; do
	#echo "x: $x"
	SYMLINK_CHECK=$(ls -la $HOME | egrep "\.$x\b" | egrep -c "^l")
	if [ $SYMLINK_CHECK -ge 1 ]; then
		echo "Current symlink target $x already exists, and will be skipped."
		continue
	fi
	
	case "$x" in
		vimrc)
			ln -sr "$HOME/dotfiles/vim.d/vimrc" "$HOME/.vimrc"
			;;
		**)
			ln -sr "$HOME/dotfiles/vim.d" "$HOME/.vim"
			;;
	esac
done
