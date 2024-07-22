#!/usr/bin/env bash

# Basic script for generating dotfile symlinks 

DOTFILES_HOME="$HOME/.dotfiles"
ln -sr ~/GIT/newdots $DOTFILES_HOME #2> /dev/null
ln -sr ~/GIT/newdots $HOME/dotfiles #2> /dev/null

# GIT
ln -sr $DOTFILES_HOME/gitd/gitignore.minimal $HOME/.gitignore #2> /dev/null
ln -sr $DOTFILES_HOME/gitd/gitconfig.minimal $HOME/.gitconfig #2> /dev/null

# BASH/ZSH
if [[ "$SHELL" = "/bin/zsh" ]];
then
    #TODO: add "zshd"
    #export ZSHRC="$DOTFILES_HOME/zshd/zshrc"
    echo "Zsh shell"
else
    echo "Bash shell"
    ln -sr "$DOTFILES_HOME/bashd/bashrc" "$HOME/.bashrc" 2> /dev/null
    #export BASHRC="$DOTFILES_HOME/bashd/bashrc"
fi


# IDE/EDITOR: LVIM > NVIM> VIM 
if [[ -f "$HOME/.local/bin/lvim" ]];
then 
    echo "Sourcing lunarvim"
    ln -sr "$DOTFILES_HOME/nvimd/lvimd" "$XDG_CONFIG_HOME/lvim" #2> /dev/null
    #export EDITOR=lvim
    #export LVIM_CONFIG="$XDG_CONFIG_HOME/lvim"

elif [[ -f "/usr/bin/nvim" ]];
then
    echo "Sourcing neovim"
    ln -sr "$DOTFILES_HOME/nvimd" "$XDG_CONFIG_HOME/nvim" #2> /dev/null
    #export EDITOR=nvim
    #export NVIM_CONFIG="$XDG_CONFIG_HOME/nvim"

else
    echo "Source vim"
    ln -sr "$DOTFILES_HOME/vimd" "$HOME/.vim" #2> /dev/null
    ln -sr "$DOTFILES_HOME/vimd/vimrc" "$HOME/.vimrc" #2> /dev/null
    export EDITOR=vim 
fi


# TMUX 
ln -sr $DOTFILES_HOME/tmuxd $HOME/.config/tmux #2> /dev/null
ln -sr $DOTFILES_HOME/tmuxd/tmux.conf $HOME/.tmux.conf #2> /dev/null
