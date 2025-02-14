#!/usr/bin/env bash
#
# Bootstrap lazygit config script

lazygit_syml_src="$HOME/dotfiles/config.d/lazygit"
lazygit_syml_targ="$HOME/.config/lazygit"

echo ln -sf "$lazygit_syml_src" "$lazygit_syml_targ"
ln -sf "$lazygit_syml_src" "$lazygit_syml_targ"
