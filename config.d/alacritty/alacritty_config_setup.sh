#!/usr/bin/env sh

# NOTE: On WSL2 the alacritty symlink path needs to be 
#       "%APPDATA%\alacritty\alacritty.toml" which maps 
#       to "C:\Users\zaccs\AppData\Roaming\alacritty"

# version controlled alacritty config file/folder
DOTFILE_DIR="$HOME/dotfiles"
ALACRITTY_CONFD="$DOTFILE_DIR/config.d/alacritty"
ALCRITTY_CONFIG="alacritty.toml"   # storing as variable in case I want to change to another file on the fly (eg. alacritty_expr.toml)

# symlink target variables
SYML_TARG_DIR="$HOME/.config/alacritty"
ln -sf "$ALACRITTY_CONFD"  "$SYML_TARG_DIR"

# test syml
echo ""
echo "Alacritty symlink check:"
find "$SYML_TARG_DIR/"
