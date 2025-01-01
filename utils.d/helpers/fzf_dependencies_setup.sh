#!/usr/bin/env bash

# Install FZF Key-Bindings and Completion Dependencies
# External Dependencies: tree, xclip, bat, fd

## ==================================
## HELPER FUNCTIONS
## ==================================

# external binary helper functs
function helper_fd {
	# fd
	echo "" && echo "Installing fd"
	sudo apt install fd-find -y
	ln -s "$(which fdfind)" "$HOME/.local/bin/fd"
}

function helper_bat {
	# bat
	echo "" && echo "Installing bat"
	sudo apt install bat -y
	ln -s "/usr/bin/batcat" "$HOME/.local/bin/bat"
}

## ==================================
## FUNCTIONS
## ==================================

# assumes as binaries installed via 'apt'
function external_binaries_setup {

	# define dependencies binaries
	EXTERNAL_DEPENDENCIES_LIST=(tree bat xclip fd)

	echo "" && echo "Checking external dependencies"
	for dpnd in ${EXTERNAL_DEPENDENCIES_LIST[@]}; do
		echo "" && echo "Checking if $dpnd is present"
		if [[ "$(apt list --installed 2> /dev/null | egrep -c "\b$dpnd\b")" -ge 1 ]];
		then
			echo "$dpnd dependency already installed"
		# use case st. to handle non-standard installs
		else
			case "$dpnd" in 
				bat)
					echo "Non-standard install"
					echo "Installing $dpnd"
					helper_fd
					echo "$dpnd installed successfully"
					;;
				fd)
					echo "Non-standard install"
					echo "Installing $dpnd"
					helper_fd
					echo "$dpnd installed successfully"
					;;
				**)
					echo "Installing $dpnd"
					echo apt install "$dpnd" -y
					sudo apt install "$dpnd" -y
					;;
			esac
		fi
	done
	# final output
	echo "" && echo "All external dependencies installed"
}

# Ensure FZF key-bindings/completions file is available for current $SHELL
# in expected dotfile repo folder so it can be sourced at runtime. Assumes 
# OS is Ubuntu/Debian
function fzf_shell_src_scripts {
	# VARS
	EXPECTED_FZF_SRC_FILES_DIR="$HOME/dotfiles/utils.d"

	# set vars for shell type FZF source file path
	if [[ "$(echo $SHELL | egrep -c "\/zsh$")" -ge 1 ]];
	then
		EXPECTED_FZF_KEYBINDS_SRC_PATH="$EXPECTED_FZF_SRC_FILES_DIR/fzf-key-bindings.zsh"
		EXPECTED_FZF_COMP_SRC_PATH="$EXPECTED_FZF_SRC_FILES_DIR/fzf-completion.zsh"
	else
		EXPECTED_FZF_KEYBINDS_SRC_PATH="$EXPECTED_FZF_SRC_FILES_DIR/fzf-key-bindings.bash"
		EXPECTED_FZF_COMP_SRC_PATH="$EXPECTED_FZF_SRC_FILES_DIR/fzf-completion.bash"
	fi
	
	# check/debug VAR value
	echo "" 
	echo "FZF Key Bindings Source File:  $EXPECTED_FZF_KEYBINDS_SRC_PATH"
	echo "FZF Completion Source File:  $EXPECTED_FZF_COMP_SRC_PATH"
	echo ""

	# put expected files in list after they are set and then check for existence
	FZF_EXPECTED_FILES=("$EXPECTED_FZF_KEYBINDS_SRC_PATH" "$EXPECTED_FZF_COMP_SRC_PATH")
	for file in ${FZF_EXPECTED_FILES[@]}; do 
		echo "Checking if $file exists"
		if [[ ! -f "$file" ]]; then
			echo "ERROR - $file does not exist, and needs to be manually resolved"
		else
			echo "$file does exists" 
		fi
	done
}

## ==================================
## MAIN
## ==================================

# install external binary dependencies
external_binaries_setup

# setup FZF shell keybind/comp source scripts for Ubuntu OS
fzf_shell_src_scripts

echo "" && echo "DONE"
