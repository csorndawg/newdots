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
