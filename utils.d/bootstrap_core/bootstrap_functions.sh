# Newer cleaner version of functions.rc except only for bootstrapping *core* dotfiles needed for new dev env.

# cache ssh passphrase for tmux pane until its killed
sshpp(){
eval $(ssh-agent) && ssh-add $HOME/.ssh/id_rsa 
}

