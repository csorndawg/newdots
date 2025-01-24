#!/usr/bin/env bash

# CGPT refence script for CTRL-G <EXECUTE> automation shell functionality 

# bind -x '"\ef": fzf_multi_action'  # Alt-F triggers fzf_multi_action

fzf_multi_action() {
  # Capture the current command line input before invoking fzf
  local prefix="$READLINE_LINE"

  # Run fzf with multi-selection and <Ctrl-g> handling
  local result
  result=$(echo -e "file1\nfile2\nfile3" | fzf --multi --bind 'ctrl-g:accept' --expect 'ctrl-g')

  if [[ $? -eq 0 ]]; then
    # Extract the key and selected items
    local key=$(echo "$result" | head -n1)
    local selections=$(echo "$result" | tail -n +2)

    if [[ "$key" == "ctrl-g" ]]; then
      # Execute each selected item with the captured prefix
      echo "Executing commands with prefix: $prefix"
      while IFS= read -r item; do
        # Construct the full command
        local cmd="$prefix $item"
        echo "$cmd"
        eval "$cmd"
	echo           # Add a blank line
      done <<< "$selections"
    else
      # Simply output the selected items
      echo "Selected items:"
      echo "$selections"
    fi
  fi
}


