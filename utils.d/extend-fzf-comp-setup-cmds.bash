# Extends FZF_COMP functionality to specified custom aliases


# setup FZF path comp (file and dir paths) for all shell commands in list
FZF_DEFAULT_PATH_COMP_EXTENSION_LIST=(tee kubectl rg fd nv patch python3 python bash source wc rsync zip)
for item in ${FZF_DEFAULT_PATH_COMP_EXTENSION_LIST[@]}; do
	echo "item: $item"
	exist_locally_check=$(which "$item" | wc -c)
	if $(( $exist_locally_check > 0 )); 
	then
	  _fzf_setup_completion path $item
	else
		echo "Skipping $item b/c its not a command or does not exist on machine"
	fi
	# echo "complete -F __fzf_default_completion $item"
	# complete -F __fzf_default_completion $item
done


# enable fzf comp with dir path only for all shell commands below 
FZF_DEFAULT_DIR_COMP_EXTENSION_LIST=(tree)
for item in ${FZF_DEFAULT_DIR_COMP_EXTENSION_LIST[@]}; do
	echo "item: $item"
	exist_locally_check=$(which "$item" | wc -c)
	if $(( $exist_locally_check > 0 )); 
	then
	  _fzf_setup_completion dir $item
	else
		echo "Skipping $item b/c its not a command or does not exist on machine"
	fi
done
