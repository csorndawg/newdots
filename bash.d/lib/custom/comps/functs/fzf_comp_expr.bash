#!/usr/bin/env bash

# Experimental FZF completion/key-bindings functionality (commands, functions, aliases, etc.)

if [[ -n "$1" ]]; then
	echo "By default this module is not loaded at runtime. To source update bashrc and pass a flag (y|yes) when sourcing."
	exit 0
fi

#
fzf_completion_with_trigger() {
	local result
	result=$(fzf) || return 1 # Launch fzf, exit if canceled

	if [[ -n "$result" ]]; then
		# Wait for a keypress to determine behavior
		read -s -n 1 -p "Press <C-x> to execute, <Enter> to insert: " key
		echo                             # Newline for readability
		if [[ "$key" == $'\x18' ]]; then # <C-x>
			eval "$result"                  # Execute the result
		else
			READLINE_LINE+="$result"         # Append the result to the current command
			READLINE_POINT=${#READLINE_LINE} # Move the cursor to the end
		fi
	fi
}

# Bind the function to a key (e.g., Ctrl-G)
bind -x '"\C-g": fzf_completion_with_trigger'
