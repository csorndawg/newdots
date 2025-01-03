#!/usr/bin/env bash

# Vars
CHEAT_CONFD_DIR="$HOME/.config/cheat"
CHEAT_CONF="conf.yml"
DOTFILE_CHEAT_CONF="$HOME/dotfiles/config.d/cheat/cheat.conf.yml"

# backup existing
if [ -f "$CHEAT_CONFD_DIR/$CHEAT_CONF" ]; then
        echo mv -v "$CHEAT_CONFD_DIR/$CHEAT_CONF"{,.bk}
        mv -v "$CHEAT_CONFD_DIR/$CHEAT_CONF"{,.bk}
fi

# make symlink
if [ ! -z "$CHEAT_CONFD_DIR" ]; then
    echo ln -sr "$DOTFILE_CHEAT_CONF" "$CHEAT_CONFD_DIR/conf.yml"
    ln -sr "$DOTFILE_CHEAT_CONF" "$CHEAT_CONFD_DIR/conf.yml"
fi
