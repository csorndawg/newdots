#!/bin/bash 

# variables
TMUX_CONF_DIR="$HOME/.config/tmux"
TMUX_SYML_SRC="$HOME/dotfiles/tmux.d"

# symlink conf
ln -sf "$TMUX_CONF_DIR/tmux.conf" "$HOME/.tmux.conf" 2>/dev/null

# symlink dotfile tmux dir to home dir
if [ ! -d "$TMUX_CONF_DIR" ]; then
    echo "Generating symlink from 'dotfiles/tmux.d' to '"$TMUX_CONF_DIR"'"
    ln -sf "$TMUX_SYML_SRC" "$TMUX_CONF_DIR"
fi

# cleanup nested symlink, output STDERR
if [ -z "$TMUX_CONF_DIR/tmux.d" ]; then 
  rm -v "$TMUX_CONF_DIR/tmux.d" 1>/dev/null
fi

# make plugins dir if does not exist
if [ ! -d "$TMUX_CONF_DIR/plugins" ]; then
  mkdir -pv "$TMUX_CONF_DIR/plugins"
fi

# clone TPM repo and move to TMUX_CONF if not present
if [[ "$(find "$HOME/dotfiles/tmux.d" -type d | egrep -c "\btpm\b")" -eq 0 ]]; then
  echo "No 'tpm' folder present in $TMUX_CONF_DIR - starting tpm setup now"

  # make temp dir to isolate git clone/move work
  TEMPDIR="$(pwd)/.tempDir" 
  mkdir -p $TEMPDIR && cd $TEMPDIR
  git clone https://github.com/tmux-plugins/tpm  2> /dev/null 
  # echo mv -vn tpm "$TMUX_CONF_DIR/plugins/tpm"
  mv -vn tpm "$TMUX_CONF_DIR/plugins/tpm"

  if [ -d "$TMUX_CONF_DIR/plugins/tpm" ]; then
    echo "Error - tpm folder still missing after clone"
    return 1
  fi

  # cleanup temp dir
  cd - 
  rm -r "$TEMPDIR"
fi

echo "TMUX is successfully configured on this machine"
