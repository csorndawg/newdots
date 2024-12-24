# NEOVIM LSP SERVER SYSTEM INSTALLS

## @TODO - move section from here to neovim from scratch installer script
## OS/SYSTEM PREREQS INSTALLS
sudo npm install --global yarn 	# needed for YAML LSP server

## INSTALL LSP SERVER(S) ON SYSTEM 
## NOTE - below doesn't cover all LSP servers that I work with, and more work/diff LSP servers will be needed. All extra work should be added to this file.
sudo npm i -g bash-language-server 
sudo npm i -g pyright
sudo npm i -g vim-language-server
sudo npm i -g vscode-langservers-extracted  #json
sudo yarn global add yaml-language-server #yaml

function configure_taplo {
   # install Rust: Taplo is written in Rust, so you'll need to have Rust installed. You can install it using rustup:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env

 	# install Taplo: Use Cargo, Rust's package manager, to install Taplo:
    cargo install taplo-cli --features lsp

  # verify Installation: Check if Taplo is installed correctly by running:
    taplo-lsp --version
}
configure_taplo
