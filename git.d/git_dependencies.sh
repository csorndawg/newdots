#!/bin/ bash

# @TODO - *** Update bashrc skeleton code for git dotfiles ***
# @TODO - Add `gh` auth login and repo cloning logic to this later. As of now only covering gitconfig/gitignore.

# Create XDG_CONFIG dir and symlink git-related dotfiles


GIT_DOTFILES_HOME="$HOME/dotfiles/git.d"

for gf in $(find $GIT_DOTFILES_HOME -type f); do
	BASENAME="$(basename $gf)"
	case $BASENAME in 
		gitignore)
			echo "gitignore"
			echo ln -sr "$GIT_DOTFILES_HOME/$BASENAME" "$HOME/.$BASENAME"
			ln -sr "$GIT_DOTFILES_HOME/$BASENAME" "$HOME/.$BASENAME"
			;;
		gitconfig)
			echo "gitconfig"
			echo ln -sr "$GIT_DOTFILES_HOME/$BASENAME" "$HOME/.$BASENAME"
			ln -sr "$GIT_DOTFILES_HOME/$BASENAME" "$HOME/.$BASENAME"
			;;
	esac
done
