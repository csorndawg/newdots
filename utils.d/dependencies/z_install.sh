#!/usr/bin/env bash

Z_XDG_DATA_DIR="$HOME/.local/share/z"
Z_DATA="$Z_XDG_DATA_DIR/z_data"
Z_SRC_REPO="$Z_XDG_DATA_DIR/src"

#export _Z_DATA="$Z_DATA"
if [ -d "$Z_XDG_DATA_DIR" ]; then
echo "$Z_XDG_DATA_DIR exists" 
exit
else 
mkdir -p "$Z_XDG_DATA_DIR" 
touch "$Z_DATA"
fi

# create temp workdir
if [ -d "$(pwd)/.tmp/z" ]; then
  rm -rf "$(pwd)/.tmp/z"
fi
cd "$(pwd)/.tmp"

# clone 'z' repo, move to expected local dir spot, and set perms for symlin
git clone https://github.com/rupa/z.git && echo ""
mv -f z "$Z_SRC_REPO"
find "$Z_SRC_REPO" -type f -exec chmod +x {} \;

# make symlink to binary and source symlink
echo ln -sf $HOME/.local/share/z/src/z.sh $HOME/.local/bin/z.sh
ln -sf $HOME/.local/share/z/src/z.sh $HOME/.local/bin/z.sh

# add below to zsh/bash rc
echo ""
echo 'NOTE: "source $HOME/.local/bin/z.sh" must be included in bash/zshrc.'
