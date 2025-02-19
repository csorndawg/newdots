#!/bin/bash

## Generate symlinks from dotfile repo to expected location
## Add script to PATH and then call functions on-the-fly to refresh symlinks

# Nvim
nvimd_symlink() {
	echo "Refreshing nvimd symlink"
	ln -sf '$HOME/dotfiles/nvim.d' '$HOME/.config/nvim'
}

# SSH
sshrc_symlink() {
	echo "Refreshing sshrc symlink"
	#echo ln -sf '$HOME/dotfiles/rc.d/ssh.rc' '$HOME/.ssh/rc'
	ln -sf "$HOME/dotfiles/rc.d/ssh.rc" "$HOME/.ssh/rc"
}

# TMUX
#   -- use to re-source tmux.rc functions on-the-fly within session
tmuxrc_symlink() {
	echo "Refreshing tmuxrc symlink"
	#echo ln -sf '$HOME/dotfiles/rc.d/ssh.rc' '$HOME/.ssh/rc'
	ln -sf "$HOME/dotfiles/rc.d/tmux.rc" "$HOME/.toolbox/TMUX_HELPERS"
}
