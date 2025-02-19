# Function enables the default shell comp as a fallback when <tab> is hit WITHOUT FZF_DEFAULT_TRIGGER present.

# IMPORTANT: This MUST be sourced LAST by bashrc/zshrc, since it applies to all commands.

_fzf_or_default_completion() {
	local cmd="${COMP_WORDS[0]}"
	local prev_word="${COMP_WORDS[COMP_CWORD - 1]}"

	# If the previous word is the FZF trigger (,,), use fzf completion
	if [[ "$prev_word" == ",," ]]; then
		__fzf_default_completion
		return
	fi

	# If there's a default Bash completion for the command, use it
	if complete -p "$cmd" &>/dev/null; then
		local comp_func
		comp_func=$(complete -p "$cmd" | awk '{print $3}')
		"$comp_func"
	fi
}

# Apply the modified completion function to all commands
complete -D -F _fzf_or_default_completion
