#!/usr/bin/env bash

Z_XDG_DATA_DIR="$HOME/.local/share/z"
Z_DATA="$Z_XDG_DATA_DIR/z_data"
mkdir -p "$Z_XDG_DATA_DIR"
touch "$Z_DATA"

# get clone and move to expected local dir spot
git clone https://github.com/rupa/z.git
echo ""
# echo mv -v z "$Z_XDG_DATA_DIR/src"
mv -v z "$Z_XDG_DATA_DIR/src"

# make symlink to binary and source symlink
# echo ln -sf $HOME/.local/share/z/src/z.sh $HOME/.local/bin/z.sh
ln -sf $HOME/.local/share/z/src/z.sh $HOME/.local/bin/z.sh

# add below to zsh/bash rc
echo ""
echo 'NOTE: "source $HOME/.local/bin/z.sh" must be included in bash/zshrc.'
