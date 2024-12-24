#!/bin bash

## @NOTE - Majority of script worked. Only issue was with "moving/symlinking" the unzipped tarball. Can clean that up later, at another time.

# source: https://www.lunarvim.org/docs/installation
# Neovim v0.9.0+ 
# Additional Dependencies: git, make, pip, python, npm, node, cargo and ripgrep 


# settings that need to be configured before downloading NVIM binary 

# make expected folders
mk_xdg_dirs() {
	mkdir -p "$HOME/."{cache,config}
	mkdir -p "$HOME/.local/"{bin,share,state}
	mkdir -p "$HOME/.local/"{work,var,opt}
	mkdir -p "$HOME/.local/var/"{temp,downloads,backups,junk}
}


# preconfigure users home dir for nvim install
chk_localbin(){

	# add ".local/bin" to PATH if missing
	USHELL="bash"	# makes changing b/w bash/zsh shells easier
	USER_SHELL_RC="$HOME/.$USHELLrc"	
	LOCAL_BIN_PATH_CHECK=$(echo "$PATH" | sed 's/:/\n/g' | egrep -c '^\/.+\.local.bin$')

	if [[ $(($LOCAL_BIN_PATH_CHECK)) -lt 1 ]]; then
		echo 'PATH="$PATH:$HOME/.local/bin"' >> "$USER_SHELL_RC"
	else
		echo "PATH already includes "'$HOME'"/.local/bin"
	fi
}


# install neovim binary 
#   - for latest release see: https://github.com/neovim/neovim/releases
dwnld_nvim() {

	# vars
	RELEASE_NUM="v0.10.2"
	NVIM_RELEASE_DWNLD_URL="https://github.com/neovim/neovim/releases/download/$RELEASE_NUM/nvim-linux64.tar.gz"
	NVIM_RELEASE_LOCAL_PATH="$HOME/.local/share/neovim/releases/$RELEASE_NUM"
	DOWNLOAD_TEMP_PATH="$HOME/.local/var/downloads/temp/nvim/new"

	# make var dirs
	mkdir -pv "$DOWNLOAD_TEMP_PATH"
	mkdir -pv "$NVIM_RELEASE_LOCAL_PATH"

	# jump to temp dwnld location
	cd "$DOWNLOAD_TEMP_PATH"
	echo ""
	echo "Current working directory: $(pwd)"
	echo curl -LO "$NVIM_RELEASE_DWNLD_URL"  &&  echo tar xzvf nvim-linux64.tar.gz 
	curl -LO "$NVIM_RELEASE_DWNLD_URL"  && tar xzvf nvim-linux64.tar.gz 

	# move curl download to local perm. path
	echo ""
	echo mv -nv  nvim-linux64 $NVIM_RELEASE_LOCAL_PATH
	mv -vn  nvim-linux64 $NVIM_RELEASE_LOCAL_PATH

	## setup symlink from binaries perm. location to .local/bin
	## dont overwrite symlink if exists, and fail silently
	echo ""
	echo "Generating symlink ..."
	echo ln -sr "$NVIM_RELEASE_LOCAL_PATH/nvim-linux64/bin/nvim" "$HOME/.local/bin"
	ln -sr "$NVIM_RELEASE_LOCAL_PATH/nvim-linux64/bin/nvim" "$HOME/.local/bin/nvim" 2> /dev/null
}

# symlink dotfiles neovim to system neovim
mk_dotfile_syml() {
	DOTFILE_NVIM_HOME="$HOME/dotfiles/nvim.d"
	
	# @TODO - Add logic to backup non-symlink existing directory, if exists
	echo "ln -sr" "$DOTFILE_NVIM_HOME" "$HOME/.config/nvim" '2> /dev/null'
	ln -sr "$DOTFILE_NVIM_HOME" "$HOME/.config/nvim" 2> /dev/null
}

# run bash functions defined above
echo ""
echo mk_xdg_dirs 
mk_xdg_dirs 

echo ""
echo chk_localbin
chk_localbin

echo ""
echo dwnld_nvim
dwnld_nvim

echo ""
echo "mk_dotfile_syml"
mk_dotfile_syml

echo ""
echo "Done. Script completed without issues."
echo ""

