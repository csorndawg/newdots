#!/usr/bin/bash

# Script for tmux key-binding to source fzf config on the fly


FZF_CONF="$HOME/git/newdots/config.d/fzf/fzf.config"
source $FZF_CONF
echo "Sourced $FZF_CONF successfully"
