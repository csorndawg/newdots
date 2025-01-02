#!/usr/bin/env bash

# FZF out-of-the-box shell key-bindings and completions integration. 
# Requries fzf version >= 0.48.0
# Latest `apt install` version: 0.44.1 (debian)
# `apt install` version < required version, so FZF binary will be 
# installed from GIT and moved to $PATHs $LOCAL_BIN folder.

# @TODO: Add logic to `apt remove` existing FZF binaries or any 
# LOCAL_BIN fzf binaries or symlinks before reinstalling

# Exit script on any error
set -e

# Define variables
REPO="junegunn/fzf"
LATEST_RELEASE_API="https://api.github.com/repos/$REPO/releases/latest"
DOWNLOAD_DIR="$HOME/.local/var/dwnlds/tmp/.tmp"
TARG_DEST="$HOME/.local/bin"

# Create download directory if it doesn't exist and set it as CWD for download
mkdir -p "$DOWNLOAD_DIR" && cd $DOWNLOAD_DIR 
mkdir -p "$TARG_DEST"

## HELPER FUNCTIONS

# remove exitsting fzf binaries/symlinks
function fzf_remover {

	if [ -f "$HOME/.local/bin/fzf" ]; then
		rm -v  "$HOME/.local/bin/fzf"
	fi

	# 2> /dev/null omits apt CLI warning
	if [ $(sudo apt list --installed 2> /dev/null | egrep -c "\bfzf\b") -ge 1 ]; then
		echo "Removing 'apt' installed FZF binary"
		sudo apt remove fzf
		echo "Removed 'apt' installed FZF binary"
	fi
}

# delete existing version of FZF if it doesnt meet min version requirements
function chk_fzf_version {
		
		FZF_VERSION=$(fzf --version | cut -f 1,2 -d '.')
		BUILD_V=$(echo $FZF_VERSION | cut -f 1 -d '.')
		RELEASE_V=$(echo $FZF_VERSION | cut -f 2 -d '.')
		if [[ $((BUILD_V)) -ge 0 ]] && [[ $((RELEASE_V)) -ge 48 ]];
			then
			echo "Existing FZF version $FZF_VERSION meets version requirements. Exiting script"
			exit 0
		else
			echo "RELEASE_V: $RELEASE_V"
			echo "Existing FZF version $FZF_VERSION does not meet version requirements"
			echo "Existing FZF version will be removed and updated to a version >= 0.48.0"
			fzf_remover 2> /dev/null
			echo "Succesfully removed existing FZF binary"
			echo "" && echo "Starting FZF download"
			fzf_dwnldr
			echo "Updated FZF binary downloaded successfully"
		fi
}

# Download updated FZF version and symlink to local/bin
function fzf_dwnldr {

	# Fetch latest release information
	echo "Fetching latest release information for $REPO..."
	LATEST_RELEASE_JSON=$(curl -s "$LATEST_RELEASE_API")

	# Extract the tarball URL for the latest release
	TARBALL_URL=$(echo "$LATEST_RELEASE_JSON" | jq -r '.assets[] | select(.name | endswith("linux_amd64.tar.gz")) | .browser_download_url')

	if [[ -z "$TARBALL_URL" ]]; then
			echo "Error: Could not find a suitable tarball for Linux AMD64 in the latest release."
			exit 1
	fi

	# Download the tarball
	TARBALL_NAME=$(basename "$TARBALL_URL")
	DOWNLOAD_PATH="$DOWNLOAD_DIR/$TARBALL_NAME"
	FZF_BINARY_PATH="$DOWNLOAD_DIR/fzf"

	echo "Downloading $TARBALL_NAME to $DOWNLOAD_PATH..."
	curl -L -o "$DOWNLOAD_PATH" "$TARBALL_URL"

	# Extract the tarball
	echo "Extracting $TARBALL_NAME..."
	tar -xzf "$DOWNLOAD_PATH" -C "$DOWNLOAD_DIR"

	# move binary from tmp to local/bin
	mv -v "$FZF_BINARY_PATH" "$TARG_DEST/fzf"
	cd ~ # move out of tmp CWD so it can be cleaned up

	# Cleanup the tarball
	rm -rv "$DOWNLOAD_DIR"
}


## MAIN LOGIC

# Check if FZF exists, and if so then check if its version is sufficient
if [ $(which fzf | wc -c) -gt 1 ]; then
	echo "Existing FZF binary found"
	echo "Checking if version is sufficient"
	#echo "Running chk_fzf_version"
	chk_fzf_version 
else
	echo "No FZF binary exists"
	echo "Installing FZF from $REPO"
	fzf_dwnldr
fi

echo "" && echo "Updated fzf version: $(fzf --version)"
