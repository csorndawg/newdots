#!/usr/bin/env bash

# remove existing fzf
sudo apt purge fzf -y

# VARS
TMPDIR="$(pwd)/.tmp"
FZF_DATA_DIR="$HOME/.local/share/fzf"

cd $TMPDIR && echo "CWD: $(pwd)"
mkdir -pv "$FZF_DATA_DIR"
git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DATA_DIR"
cd "$FZF_DATA_DIR"

echo ""
echo "Running WSL extras"

echo dos2unix "$(pwd)/install"
dos2unix "$(pwd)/install"

echo dos2unix "$(pwd)/shell/key-bindings.bash"
dos2unix "$(pwd)/shell/key-bindings.bash"

echo dos2unix "$(pwd)/shell/completion.bash"
dos2unix "$(pwd)/shell/completion.bash"

ln -srf "$FZF_DATA_DIR/shell/completion.bash" "$HOME/.local/bin/completions.windows.bash"
ln -srf "$FZF_DATA_DIR/shell/key-bindings.bash" "$HOME/.local/bin/key-bindings.windows.bash"
