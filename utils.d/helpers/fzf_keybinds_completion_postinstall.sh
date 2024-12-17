#!/usr/bin/bash

# Setup script that enables FZF keybinding and completion within BASH 
# shell. This script expects FZF to be already be installed, via VIM-PLUG ONLY,
# before being ran.


## variables
FZF_PLUG_DIR="$HOME/.vim/plugged/fzf"

## check if vim-plug FZF directory exists on local, return error if 
# missing, otherwise run setup logic
if [ ! -d "$HOME/.vim/plugged/fzf" ]; then
  echo ""
  echo "Error - the expected '$HOME/.vim/plugged/fzf' is missing. To generate run `PlugInstall` within a Vim buffer to generate. After generating rerun this script"
else
  cd $FZF_PLUG_DIR 
  echo "Current Working Dir: $(pwd)"
  bash "./install"
  
  # make symlinks 
  echo "Making fzf/bin symlinks ..."
  for binary in $(find "$FZF_PLUG_DIR/bin" -type f); do
    binary_name="$(basename $binary)"
    echo ln -sr $binary "$HOME/.local/bin/$binary_name"
    ln -sr $binary "$HOME/.local/bin/$binary_name" 2> /dev/null
  done

  echo "" ; echo "Making fzf/shell symlinks ..."
  for fzf_shell_file in $(find "$FZF_PLUG_DIR/shell" -type f -name "*.bash"); do
    fzf_shell_file_name="$(basename $fzf_shell_file )"
    echo "fzf_shell_file:   $fzf_shell_file_name"

    echo ln -sr $fzf_shell_file "$HOME/.local/bin/$fzf_shell_file"
    ln -sr "$fzf_shell_file" "$HOME/.local/bin/$fzf_shell_file" 2> /dev/null
  done

  echo "FZF post-install setup completed successfully"
fi
