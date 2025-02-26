#!/usr/bin/env bash

pip install -q argcomplete
if (( $(pip freeze | egrep -c argcomp) <= 0 )); then
	echo "Error - argcomplete package missing. After installing with 'pip install argcomplete' rerun this script"
	return 1
fi

# if argcomplete present check if symlink exists, otherwise activate and adjust symlink
if [ -L "$HOME/.bash_completion" ];
then
	echo "argcomplete bash completion symlink already exists"
	return 0
else
	activate-global-python-argcomplete
	mv -v "$HOME/.bash_completion" "$HOME/dotfiles/bash.d/completers/_python_argcomplete.bash"
	echo ln -s "$HOME/dotfiles/bash.d/completers/_python_argcomplete.bash" "$HOME/.bash_completion" 
	ln -s "$HOME/dotfiles/bash.d/completers/_python_argcomplete.bash" "$HOME/.bash_completion" 
fi
