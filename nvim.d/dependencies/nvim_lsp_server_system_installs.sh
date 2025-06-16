#!/usr/bin/bash


# Dependency management script for all the Neovim Mason tools (LSP servers, DAP debuggers, etc.) that I use in my workflow
# Dependencies: npm, cargo, curl

# NPM installer
function install_npm {
    sudo apt update -y
    sudo apt install nodejs npm -y
}
install_npm

# test npm installed/available
node -v
npm -v
echo "NPM installed check passed"

# TODO: add function to cargo install, if cargo is missing from system

# Installing system dependencies for each mason tool

# needed for YAML LSP server
sudo npm install --global yarn 	

## INSTALL LSP SERVER(S) ON SYSTEM 
## NOTE - below doesn't cover all LSP servers that I work with, and more work/diff LSP servers will be needed. All extra work should be added to this file.
sudo npm i -g bash-language-server 
sudo npm i -g pyright
sudo npm i -g vim-language-server
sudo npm i -g vscode-langservers-extracted  #json
sudo yarn global add yaml-language-server #yaml

function configure_taplo {

  CARGO_ENV_PATH="$HOME/.cargo/env"
  IS_CARGO_INSTALLED=$(which cargo | wc -c)
  if (( $IS_CARGO_INSTALLED > 0 )); then
      echo "Cargo already installed on machine. New install will be skipped."
  else
    # Install Rust: Taplo is written in Rust, so you'll need to have Rust installed. 
    # You can install it using rustup:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
  fi

  # ensure cargo bin is on $PATH so taplo can be picked up/used by neovim
  CARGO_BIN_PATH_TEST=$(echo "$PATH" | sed 's/;/\n/g' | egrep "cargo\/\.bin" | wc -l )
  if (( $CARGO_BIN_PATH_TEST < 1 )); then
      echo 'Cargo bin missing from $PATH'
      echo 'Adding cargo bin to $PATH'
      export PATH="$PATH:$HOME/.cargo/bin"
  else
      echo 'Cargo bin already on $PATH'
  fi

 	# install Taplo: Use Cargo, Rust's package manager, to install Taplo:
  cargo install taplo-cli --features lsp

  # verify Installation: Check if Taplo is installed correctly by running:
  taplo lsp --version
}
configure_taplo
