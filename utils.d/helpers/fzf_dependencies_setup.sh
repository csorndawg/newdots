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
					helper_bat
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

## ==================================
## MAIN
## ==================================

# install external binary dependencies
external_binaries_setup 1> /dev/null || echo "Issue occurred during FZF dependency setup"
