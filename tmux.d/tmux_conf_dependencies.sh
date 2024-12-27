#!/bin/bash 

# tmux.conf dependencies && preconfig setup
TMUX_CONF_DIR="$HOME/.config/tmux"

# cleanup nested symlink, if present
rm -v "$TMUX_CONF_DIR/tmux.d" 2>/dev/null

# clone TPM into tmux/plugin location
mkdir -pv "$TMUX_CONF_DIR/plugins"

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
