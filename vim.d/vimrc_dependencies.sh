#!/bin bash

# variables
DOTFILES_VIM_DIR="$HOME/dotfiles/vim.d"
VIM_SYMLINK_PATTERNS=(vim vimrc)

# make dirs dependencies

for x in ${VIM_SYMLINK_PATTERNS[@]}; do

  # create symlinks to expected locations on system
	case "$x" in
		vimrc)
			ln -sf "$HOME/dotfiles/vim.d/vimrc" "$HOME/.vimrc"
			;;
		**)
			ln -sf "$HOME/dotfiles/vim.d" "$HOME/.vim"
			;;
	esac

  # make vim-plug directory
  vim_plug_dir="$HOME/.vim/plugged"
  if [ ! -d "$vim_plug_dir" ]; then
    echo mkdir -pv "$HOME/.vim/plugged"
    mkdir -pv "$HOME/.vim/plugged"  
  fi

  # run plugin dependency management script
  echo bash "$HOME/dotfiles/vim.d/nord-custom-symlinker.sh"
  bash "$HOME/dotfiles/vim.d/nord-custom-symlinker.sh"
done
