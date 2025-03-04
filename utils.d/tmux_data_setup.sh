#!/usr/bin/env bash

# Create tmux app data dir and symlinks

## "prompt" covers all commands ran from tmux-prompt (eg. ':move-window 1:')
TMUX_HIST_DIRS=(pane prompt session window adhoc)
XDG_TMUX="$HOME/.local/share/tmux/tmux_history"

for x in ${TMUX_HIST_DIRS[@]}; do
	tmpdir="$XDG_TMUX/$x"
	echo "tmpdir: $tmpdir"
	echo mkdir -pv $tmpdir
	mkdir -pv $tmpdir
done

# make symlink to parent subfolder
echo ln -sf "$XDG_TMUX" "$HOME/.tmux_history"
ln -sf "$XDG_TMUX" "$HOME/.tmux_history"
