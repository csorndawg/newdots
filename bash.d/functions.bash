# BASHRC Functions

# TODO: add check to see if cwd within git repo, and if so quit gracefully
gpou() {
	git push -u origin $(git branch --show-current)
}

# git diff HEAD <X>  where X is 1
gdfhx() {
	if [ -z "$1" ]; then
		X=1
	else
		X="$1"
	fi
	git diff HEAD~$X
}

## RSYNC HELPER FUNCTIONS

## rsync dir - dryrun
rsdd() {
	#echo "rsync --dry-run -azvphr"
	rsync --dry-run -azvphr $1 $2
}
## rsync dir - execute
rsdx() {
	rsync -azvphr $1 $2
}
## rsync file - dryrun
rsfd() {
	rsync --dry-run -azvph $1 $2
}
## rsync file - execute
rsfx() {
	rsync -azvphr $1 $2
}

mcd() {
	DIRPATH="$1"
	mkdir -p $DIRPATH && cd $DIRPATH
}

# recache git credentials -- temporary fix until I can find a way to
# share $SSH_AUTH b/w tmux windows
gcc() {
	eval $(ssh-agent) && ssh-add "$HOME"/.ssh/id_rsa
	git config credential.helper 'cache --timeout=3600'
}

##
## Scratch file generator
##

## qxs - (Q)ui(X) (S)cratch file genertor
qxs() {

	# function must be given an ARG when called
	# ARG must map to one of the below scratch "file flags"
	#
	# function edits:
	#   - bash sandbox (b)
	#   - python sandbox (p)
	#   - dotfiles sandbox (d)
	#   - sql sandbox (s)
	#   - testing sandbox ()
	#   - junk sandbox (j)      ## @TODO - create script to auto remove files from folder after X time (> 1 week)
	#   - git sandbox (g)
	#   - written txt/markdown notes (w)   ## 'w' for written, use 'h' for human/help if 'w' taken
	#

	## variables
	SANDBOXES_HOME_DIR="$HOME/.local/var/temp/sandboxes"
	TEXTFILES_HOME_DIR="$HOME/git/kb2/quick/autostash" # diff location for written notes/docs

	# set EDITOR to vim as fallback if DNE
	#[ -z "$EDITOR" ] && EDITOR=vim

	# scalably add/remove/modify variables dirpaths
	VAR_LIST=($SANDBOXES_HOME_DIR $TEXTFILES_HOME_DIR)
	for varx in ${VAR_LIST[@]}; do
		[[ -d "$varx" ]] || mkdir -p "$varx"
		mkdir -p $varx
	done

	## make subdirs first
	SUBDIRS=(bash python dotfiles git sql junk testing all)
	for sd in ${SUBDIRS[@]}; do
		mkdir -p "$SANDBOXES_HOME_DIR/$sd"
	done

	# @TODO - Add upper/lower case variations to CASE statement for existing flags
	# create scratchfile from CASE statement flag input
	case "$1" in

	b | B | bash | sh | shell)
		echo -n "Bash/Shell sandbox FLAG passed"
		mkdir -p "$SANDBOXES_HOME_DIR/bash"
		$EDITOR "$SANDBOXES_HOME_DIR/bash/bash_scratch_$(date +%Y%m%d-%H%M%S).sh"
		;;

	p | P | python)
		echo -n "Python sandbox FLAG passed"
		mkdir -p "$SANDBOXES_HOME_DIR/python"
		$EDITOR "$SANDBOXES_HOME_DIR/python/python_scratch_$(date +%Y%m%d-%H%M%S).py"
		;;

	d | dotfiles)
		echo -n "Dotfile sandbox FLAG passed. Append extension manually if filetype extention needed."
		mkdir -p "$SANDBOXES_HOME_DIR/dotfiles"
		$EDITOR "$SANDBOXES_HOME_DIR/dotfiles/dotfile_scratch_$(date +%Y%m%d-%H%M%S).dotfile"
		;;

	g | git)
		echo -n "Git sandbox FLAG passed"
		mkdir -p "$SANDBOXES_HOME_DIR/git"
		$EDITOR "$SANDBOXES_HOME_DIR/git/git_scratch_$(date +%Y%m%d-%H%M%S).git"
		;;

	j | junk | temp | tmp | quick | q | J)
		echo -n "Junk/Quick/Temp sandbox FLAG passed. Append extension manually if filetype extention needed."
		mkdir -p "$SANDBOXES_HOME_DIR/junk"
		$EDITOR "$SANDBOXES_HOME_DIR/junk/junk_scratch_$(date +%Y%m%d-%H%M%S).junk"
		;;

	t | test | explore | experiment | exp)
		echo -n "Test/Experiment/Explore sandbox FLAG passed. Append extension manually if filetype extention needed."
		mkdir -p "$SANDBOXES_HOME_DIR/testing"
		$EDITOR "$SANDBOXES_HOME_DIR/testing/test_scratch_$(date +%Y%m%d-%H%M%S).test"
		;;

	s | sql)
		echo -n " sandbox FLAG passed"
		mkdir -p "$SANDBOXES_HOME_DIR/sql"
		$EDITOR "$SANDBOXES_HOME_DIR/sql/sql_scratch_$(date +%Y%m%d-%H%M%S).sql"
		;;

	w | h)
		echo -n "Written/Help FLAG passed"
		mkdir -p "$TEXTFILES_HOME_DIR/qxs"
		$EDITOR "$TEXTFILES_HOME_DIR/qxs/doc_scratch_$(date +%Y%m%d-%H%M%S).md"
		;;

	*)
		echo -n "Unknown/Unspecified which defaults to ALL"
		mkdir -p "$TEXTFILES_HOME_DIR/all"
		$EDITOR "$SANDBOXES_HOME_DIR/all/all_scratch_$(date +%Y%m%d-%H%M%S).all"
		;;
	esac
}

# TODO
#gpsu (){
#    CWB="$(git branch --show-current)"
#    #git push --set-upstream origin $(git branch --show-current)
#    echo git push --set-upstream origin "$CWB"
#
#}

edf() {

	# function must be given an ARG when called
	# ARG must map to one of the below "file flags"
	#
	# function edits:
	#   - bashrc (b)
	#   - bashrc_wsl (bw)
	#   - vimrc (v)
	#   - vim_lib (vl)
	#   - init.lua (n)
	#   - neovim plugins (np)
	#   - neovim extras (nx)
	#   - neovim user (nu)
	#   - tmux.conf (t)
	#   - gitconfig (g)

	# DOTFILE path depends on host machine
	if [[ "$(echo $HOSTNAME | egrep -ci 'DESKTOP')" -ge 1 ]]; then
		DOTFILE_HOME_DIR="$HOME/dotfiles"
		echo "Current session is running on my Local machine - $HOSTNAME"
	else
		DOTFILE_HOME_DIR="$HOME/dotfiles"
	fi
	echo "DOTFILE_HOME_DIR:  $DOTFILE_HOME_DIR"

	case $1 in
	b)
		vim "$DOTFILE_HOME_DIR/bash.d/bashrc"
		;;
	bw)
		vim "$DOTFILE_HOME_DIR/bash.d/bashrc_wsl"
		;;
	t)
		vim "$DOTFILE_HOME_DIR/tmux.d/tmux.conf"
		;;
	g)
		vim "$DOTFILE_HOME_DIR/git.d/gitconfig"
		;;
	ni)
		vim "$DOTFILE_HOME_DIR/nvim.d/init.lua"
		;;
	nu)
		vim "$DOTFILE_HOME_DIR/nvim.d/lua/user"
		;;
	np)
		echo vim "$DOTFILE_HOME_DIR/nvim.d/lua/plugins"
		vim "$DOTFILE_HOME_DIR/nvim.d/lua/plugins"
		;;
	nx)
		vim "$DOTFILE_HOME_DIR/nvim.d/lua/extra"
		;;
	v)
		vim "$DOTFILE_HOME_DIR/vim.d/vimrc"
		;;
	vl)
		vim "$DOTFILE_HOME_DIR/vim.d/vim_lib"
		;;
	**)
		echo 'Unrecognized $ARG passed'
		;;
	esac
}
