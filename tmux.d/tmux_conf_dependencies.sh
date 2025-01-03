#!/bin/bash 

# Variables
TMUX_CONF_DIR="$HOME/.config/tmux"
TMUX_SYML_SRC="$HOME/dotfiles/tmux.d"

# cleanup nested symlink, if present
rm -v "$TMUX_CONF_DIR/tmux.d" 2>/dev/null

# symlink dotfile tmux dir to home dir
if [ ! -z "$TMUX_CONF_DIR" ]; then
    echo "Generating symlink from 'dotfiles/tmux.d' to '"$TMUX_CONF_DIR"'"
    ln -sr $TMUX_SYML_SRC $TMUX_CONF_DIR
fi

if [ ! -z "$HOME/.tmux" ]; then
    echo "Generating symlink from 'dotfiles/tmux.d' to '"$HOME/.tmux"'"
    ln -sr "$TMUX_SYML_SRC" "$HOME/.tmux"
fi

#mkdir -pv "$TMUX_CONF_DIR/plugins"

# clone TPM repo and move to TMUX_CONF if not present
if [[ "$(find "$HOME/dotfiles/tmux.d" -type d | egrep -c "\btpm\b")" -eq 0 ]]; then
  echo "TPM folder missing from TMUX_CONF directory, starting setup now."
  echo "git clone https://github.com/tmux-plugins/tpm  $TMUX_CONF_DIR/plugins/tpm"

  TEMPDIR="$(pwd)/.tempDir" 
  mkdir -p $TEMPDIR && cd $TEMPDIR
  git clone https://github.com/tmux-plugins/tpm  2> /dev/null #"$TMUX_CONF_DIR/plugins/tpm" 2> /dev/null
  mv -vn tpm "$TMUX_CONF_DIR/plugins/tpm"
else
  echo "TPM folder exists in TMUX_CONF"
fi
