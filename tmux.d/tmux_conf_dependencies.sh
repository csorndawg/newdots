#!/bin/bash 

# tmux.conf dependencies && preconfig setup
echo ""

# symlink tmux.conf, if DNE
if [[ ! -z "$HOME/dotfiles/tmux.d/tmux.conf" && -z "$HOME/.tmux.conf" ]]; then 
    echo ''
    echo 'No tmux.conf file found. Creating dotfile symlink.'
    ln -sr "$HOME/dotfiles/tmux.d/tmux.conf" "$HOME/.tmux.conf" 2> /dev/null
fi

# dependency variables 
XDG_CONF_HOME_DIR="$HOME/.config" 
XDG_CONF_TMUX_DIR="$XDG_CONF_HOME_DIR/tmux"
DOTFILES_TMUX_DIR="$HOME/dotfiles/tmux.d"

# make XDG dependency symlink
#echo "mkdir -p $XDG_CONF_HOME_DIR" 
#echo ln -sr "$DOTFILES_TMUX_DIR" "$XDG_CONF_TMUX_DIR"
mkdir -p "$XDG_CONF_HOME_DIR" 
ln -sr "$DOTFILES_TMUX_DIR" "$XDG_CONF_TMUX_DIR" 2> /dev/null

# cleanup nested symlink, if present
rm -v "$XDG_CONF_TMUX_DIR/tmux.d" 2>/dev/null

# clone TPM into tmux/plugin location
mkdir -p "$XDG_CONF_TMUX_DIR/plugins"
echo "git clone https://github.com/tmux-plugins/tpm  $XDG_CONF_TMUX_DIR/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm  "$XDG_CONF_TMUX_DIR/plugins/tpm" 2> /dev/null
