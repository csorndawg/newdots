#!/usr/bin/env bash

# dependencies: tree, xclip, bat, fd

# tree
echo "" && echo "Installing tree"
sudo apt install tree -y

# xclip
echo "" && echo "Installing xclip"
sudo apt install xclip -y


# fd
echo "" && echo "Installing fd"
sudo apt install fd-find -y
ln -s "$(which fdfind)" "$HOME/.local/bin/fd"


# bat
echo "" && echo "Installing bat"
sudo apt install bat -y
ln -s "/usr/bin/batcat" "$HOME/.local/bin/bat"

echo "" && echo "All dependencies installed"
