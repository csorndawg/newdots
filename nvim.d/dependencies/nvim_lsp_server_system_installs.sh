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
