# Dotfiles `apt` Install Dependencies 

## apt only
sudo apt install rlwrap
sudo apt install ripgrep
sudo apt install make
sudo apt install python3-pip
sudo apt install nodejs
sudo apt install npm
sudo apt install unzip
sudo apt install fzf
sudo apt install python3.10-venv

## apt with post-install conf

### bat
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

### fd
sudo apt install fd-find
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
