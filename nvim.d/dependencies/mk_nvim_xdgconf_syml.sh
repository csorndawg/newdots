#!/usr/bin/bash

# Vars
DOTFILES_NVIM_DIR="$HOME/dotfiles/nvim.d"
XDG_CONFIG_HOME="$HOME/.config"
CWD="$HOME"

if [[ ! -d $XDG_CONFIG_HOME ]]; then
  mkdir -p $XDG_CONFIG_HOME
fi

ln -sr $DOTFILES_NVIM_DIR $XDG_CONFIG_HOME/nvim 2> /dev/null
