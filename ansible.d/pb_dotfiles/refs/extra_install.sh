#!/usr/bin/env sh

# Ongoing shell script for installing specific open source software on Ubuntu OS machine that requires additional configuration/steps besides "apt install <software>". 
# 

# Script also acts as documentation/reference when migrating the installations to ansible.

install_chtsh(){
  PATH_DIR="$HOME/.local/bin"  
  mkdir -p "$PATH_DIR"
  curl https://cht.sh/:cht.sh > "$PATH_DIR/cht.sh"
  chmod +x "$PATH_DIR/cht.sh"

  #@DEBUG: Print permissions and name for newly installed file.
  binary_perm="$(ls -l "$PATH_DIR/cht.sh"| awk -F ' ' '{print $1}')"
  binary_path="$(ls -l "$PATH_DIR/cht.sh"| awk -F ' ' '{print $NF}')"
  binary_name="$(basename $binary_path)"
  echo ""  &&  echo "$binary_name permissions:  $binary_perm"
}

# cht.sh install https://github.com/chubin/cheat.sh?tab=readme-ov-file#installation
install_chtsh
