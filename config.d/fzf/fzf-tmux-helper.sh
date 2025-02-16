#!/usr/bin/env bash

FZF_CONFIGD="$HOME/git/dotfiles/config.d/fzf"
FZF_TMUX_SCRIPT="$FZF_CONFIGD/fzf-tmux"
LOCAL_BIN_DPATH="$HOME/.local/bin"

# ensure correct perms
chmod +x "$FZF_TMUX_SCRIPT"
echo ln -sf "$FZF_TMUX_SCRIPT" "$LOCAL_BIN_DPATH"
ln -sf "$FZF_TMUX_SCRIPT" "$LOCAL_BIN_DPATH"
