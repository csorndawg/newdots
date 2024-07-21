#!/usr/bin/env bash

# Basic script for generating dotfile symlinks 

DOTFILES_HOME="$HOME/.dotfiles"
ln -sr ~/GIT/newdots $DOTFILES_HOME

# GIT
ln -srf $DOTFILES_HOME/gitd/gitignore.minimal $HOME/.gitignore
ln -srf $DOTFILES_HOME/gitd/gitconfig.minimal $HOME/.gitconfig

# BASH/ZSH
if [[ "$SHELL" = "/bin/zsh" ]];
then
    #TODO: add "zshd"
    export zshrc="$DOTFILES_HOME/zshd/zshrc"
else
    ln -srf "$DOTFILES_HOME/bashd/bashrc" "$HOME/.bashrc"
fi


# IDE/EDITOR: LVIM > NVIM> VIM 
if [[ -f "$HOME/.local/bin/lvim" ]];
then 
    echo "Sourcing lunarvim"
    ln -srf "$DOTFILES_HOME/nvimd/lvimd" "$XDG_CONFIG_HOME/lvim"
    EDITOR=lvim
    export LVIM_CONFIG="$XDG_CONFIG_HOME/lvim"

elif [[ -f "/usr/bin/nvim" ]];
then
    echo "Sourcing neovim"
    ln -srf "$DOTFILES_HOME/nvimd" "$XDG_CONFIG_HOME/nvim"
    EDITOR=nvim
    export NVIM_CONFIG="$XDG_CONFIG_HOME/nvim"

else
    echo "Source vim"
    ln -srf "$DOTFILES_HOME/vimd" "$HOME/.vim"
    ln -srf "$DOTFILES_HOME/vimd/vimrc" "$HOME/.vimrc"
    EDITOR=vim 
fi


# TMUX 
ln -srf $DOTFILES_HOME/tmuxd $DOTFILES_HOME/tmux
ln -srf $DOTFILES_HOME/tmuxd/tmux.conf $HOME/.tmux.conf
