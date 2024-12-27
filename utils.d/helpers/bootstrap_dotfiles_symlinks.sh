#!/usr/bin/bash

# Handle all pre-configuration dependencies, generate symlinks, etc. for dotfiles/personal dev. environment. As of now this script only covers the below dotfile components.
#
# @TODO: Add additional components/logic for rest of dotfile/personal development environment/workflow.
# @TODO: Cleanup code into functions, and refactor any duplicated logic within this, or any other existing file
#
# @TODO: Cleanup existing symlink 2>/dev/null / force symlink workaround

## ------------------------------
## Variables
## ------------------------------

DOTFILES_DIR="$HOME/dotfiles"
BASHD_DIR="$DOTFILES_DIR/bash.d"
GITD_DIR="$DOTFILES_DIR/git.d"
NVIM_DIR="$DOTFILES_DIR/nvim.d"
TMUXD_DIR="$DOTFILES_DIR/tmux.d"
VIMD_DIR="$DOTFILES_DIR/vim.d"
ZSHD_DIR="$DOTFILES_DIR/zsh.d"

## ------------------------------
## Functions
## ------------------------------

## XDG folders/export
function config_xdgs {
	mkdir -p "$HOME/.local/{bin,share,state,runtime,var,common}" && mkdir -p "$HOME"/.{cache,config}
	export XDG_BIN_HOME="$HOME/.local/bin"
	export XDG_STATE_HOME="$HOME/.local/state"
	export XDG_DATA_HOME="$HOME/.local/share"
	export XDG_COMMON_HOME="$HOME/.local/common"
	export XDG_CACHE_HOME="$HOME/.cache"
	export XDG_CONFIG_HOME="$HOME/.config"
}

## bash
function config_bashd {
	# @FIXME
	#find "$BASHD_DIR" -type f -name "*.bashrc" -or -name "*.completer" \
	#	-exec echo source {} \;

	# @TESTME: Productionize after confirming it works
	source $HOME/dotfiles/utils.d/helpers/bootstrap_bashrc.sh && echo "successfully sourced bashrc bootstrap script"
}

## git
function config_gitd {
	ln -sr "$GITD_DIR/gitignore" "$HOME/.gitignore" 2>/dev/null
	ln -srf "$GITD_DIR/gitconfig" "$HOME/.gitconfig" 2>/dev/null
}

## vim
function config_vimd {
	ln -srf "$VIMD_DIR/vimrc" "$HOME/.vimrc" 2>/dev/null
}

## tmux
# make symlinks for XDG_CONFIG/tmux and tmux.conf
function config_tmuxd {
	ln -sr "$TMUXD_DIR" "$HOME/.config/tmux" 2>/dev/null
	ln -srf "$TMUXD_DIR/tmux.conf" "$HOME/.tmux.conf" 2>/dev/null

	# handle tpm setup automatically
	bash "$HOME/dotfiles/tmux.d/tmux_conf_dependencies.sh" || echo "Error occured while running tmux_conf_dependencies script"
}

## ========================================
## Main
## ========================================

# xdg setup
config_xdgs && echo "config_xdgs configured successfully"

#  setup git
config_gitd

#  setup
config_vimd

#  setup bash
config_bashd

# tmux setup
config_tmuxd echo "config_tmuxd configured successfully"

#  future @BOILERPLATE
#  setup
#config_
