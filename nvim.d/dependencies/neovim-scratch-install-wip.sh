#!/bin bash

## @NOTE - Majority of script worked. Only issue was with "moving/symlinking" the unzipped tarball. Can clean that up later, at another time.

# source: https://www.lunarvim.org/docs/installation
# Neovim v0.9.0+ 
# Additional Dependencies: git, make, pip, python, npm, node, cargo and ripgrep 


# settings that need to be configured before downloading NVIM binary 
echo 'PATH="$PATH:$HOME/.local/bin"' >> $HOME/.bashrc
mkdir -p "$HOME/.{cache,config}"
mkdir -p "$HOME/.local/{bin,share,state}"
DOWNLOAD_TARG_PATH="$HOME/.local/share/neovim/releases"

# install neovim binary 
#   - for latest release see: https://github.com/neovim/neovim/releases
DOWNLOAD_TEMP_PATH="$HOME/.temp/downloads/nvim/new"
NVIM_RELEASE_DWNLD_URL="https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz"
mkdir -p "$DOWNLOAD_TEMP_PATH"
cd "$DOWNLOAD_TEMP_PAT"
curl -LO "$NVIM_RELEASE_DWNLD_URL"  && tar xzvf nvim-linux64.tar.gz && mv -v  nvim-linux64 $DOWNLOAD_TARG_PATH

# make symlink from perm. location to LOCALBIN
echo ln -sr "$DOWNLOAD_TARG_PATH/nvim-linux64/bin/nvim" "$HOME/.local/bin"
ln -sr "$DOWNLOAD_TARG_PATH/nvim-linux64/bin/nvim" "$HOME/.local/bin"


# install neovim dependencies
echo ''
echo 'Installing (some) nvim plugin dependencies'
sudo apt install ripgrep
sudo apt install make
sudo apt install python3-pip
sudo apt install nodejs
sudo apt install npm
##sudo apt install cargo
