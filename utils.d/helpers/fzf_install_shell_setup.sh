#!/usr/bin/env bash

# FZF out-of-the-box shell key-bindings and completions integration. 
# Requries fzf version >= 0.48.0
# Latest `apt install` version: 0.44.1 (debian)
# `apt install` version < required version, so FZF binary will be 
# installed from GIT and moved to $PATHs $LOCAL_BIN folder.

# Exit script on any error
set -e

# Define variables
REPO="junegunn/fzf"
LATEST_RELEASE_API="https://api.github.com/repos/$REPO/releases/latest"
DOWNLOAD_DIR="$HOME/.local/var/dwnlds/tmp/.tmp"

# Create download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

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
			echo "Existing FZF version $FZF_VERSION does not meet version requirements"
			echo "Existing FZF version will be removed and FZF will be re-installed with the latest version"
			exit 1
		fi
}

# Check if FZF with sufficient version already present
chk_fzf_version || echo "FZF needs updating"

checkVersionOutput=$(chk_fzf_version)
echo "checkVersionOutput: $checkVersionOutput"

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

echo "Downloading $TARBALL_NAME to $DOWNLOAD_PATH..."
curl -L -o "$DOWNLOAD_PATH" "$TARBALL_URL"

# Extract the tarball
echo "Extracting $TARBALL_NAME..."
tar -xzf "$DOWNLOAD_PATH" -C "$DOWNLOAD_DIR"



# Cleanup the tarball
rm "$DOWNLOAD_PATH"

echo "fzf has been downloaded and extracted to $DOWNLOAD_DIR."

