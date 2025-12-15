# Extends FZF_COMP functionality to specified custom aliases

source $HOME/dotfiles/bash.d/lib/custom/comps/aliases/git.comp >> "$HOME/.local/runtime/logs/bashrc.log" 2>&1

# @FIXME: Below works for some of use cases not all, needs logic improvement
# example: grss wont work if you've removed the file since FZF_COMP_PATH wont see it
# ... need actual git functions

#GIT_ALIASES_LIST=(grm ga gd gstp grs grss gsta gds gdm gdms gdo gdom)
GIT_ALIASES_LIST=()
#TEMP_SKIP_LIST=(ga)
for gaf in ${GIT_ALIASES_LIST[@]}; do

	# need to skip certain aliases until I can get both git branch/path
	# completion AND FZF_PATH comp working together
	for skip_file in ${TEMP_SKIP_LIST[@]}; do
		if [[ "$skip_file" == "$gaf" ]]; then
			__git_complete "$gaf" _git_add
		#	continue
		fi
	done
	echo "complete -F __fzf_default_completion $gaf"
	#complete -o bashdefault -o default -F _fzf_path_completion $cga
	complete -F __fzf_default_completion "$gaf"
done

# TODO: Add config file that extends FZF default shell comp to any command/alias in the file. After
# making the file, move any command/alias defined below to the file to clean up this script.
# Enable FZF default shell completion for shell commands and aliases
FZF_DEFAULT_COMP_EXTENSION_LIST=(tee rgv rgi wc rsync zip)
for item in ${FZF_DEFAULT_COMP_EXTENSION_LIST[@]}; do
	echo "item: $item"
	echo "complete -F __fzf_default_completion $item"
	complete -F __fzf_default_completion $item
done
