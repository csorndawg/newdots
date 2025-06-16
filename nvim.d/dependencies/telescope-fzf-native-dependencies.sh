#!/usr/bin/ bash

# set telescope-fzf-native path (assumes plugin installed via Lazy & follows conventional paths for Neovim plugins)
TELESCOPE_FZF_NATIVE_DIR="$HOME/.local/share/nvim/lazy/telescope-fzf-native.nvim"
cd "$TELESCOPE_FZF_NATIVE_DIR"

# run MAKEFILE to compile 'fzf.so' binary required by the plugin
make
