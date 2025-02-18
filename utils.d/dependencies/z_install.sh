#!/usr/bin/env bash

Z_XDG_DATA_DIR="$HOME/.local/share/z"
Z_DATA="$Z_XDG_DATA_DIR/z_data"
#export _Z_DATA="$Z_DATA"

# get clone and move to expected local dir spot
git clone https://github.com/rupa/z.git
mv -v z $Z_XDG_DATA_DIR

# make symlink to binary and source symlink
ln -sf $HOME/.local/share/z/src/z.sh $HOME/.local/bin/z.sh

# add below to zsh/bash rc
#source $HOME/.local/bin/z.sh
