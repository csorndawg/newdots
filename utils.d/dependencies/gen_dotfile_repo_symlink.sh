#!/usr/bin bash

GITWORK_DIR="$HOME/git"
DOTFILE_REPO_NAME="newdots"
DOTFILE_REPO_ABSPATH="$GITWORK_DIR/$DOTFILE_REPO_NAME"

# @TODO - Mirror taskwarrior logic to backup and overwrite if directory (not symlink) exists

# silently fail if symlink exists
ln -sr "$DOTFILE_REPO_ABSPATH" "$HOME/.dotfiles" 2> /dev/null
ln -sr "$DOTFILE_REPO_ABSPATH" "$HOME/dotfiles" 2> /dev/null
ln -sr "$DOTFILE_REPO_ABSPATH" "$HOME/git/dotfiles" 2> /dev/null
