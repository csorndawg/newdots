#!/usr/bin/env bash

# @BROKEN: FZF comp x. alias integration is broken and needs to remain commented out until fixed

# How to assign completion: complete -F _custom_git_diff <target>
# Example: complete -F _custom_git_diff_files gd

# @NOTE: Steps needed to replicate for other `oh-my-bash` git completion functions.
# Ran `declate -f _git_diff` to get comp function from oh-my-bash. Copied code as new function `_custom_git_diff()` and just commented out the doubleslash return check.
_custom_git_diff() {
	#	__git_has_doubledash && return
	case "$cur" in
	--diff-algorithm=*)
		__gitcomp "$__git_diff_algorithms" "" "${cur##--diff-algorithm=}"
		return
		;;
	--submodule=*)
		__gitcomp "$__git_diff_submodule_formats" "" "${cur##--submodule=}"
		return
		;;
	--color-moved=*)
		__gitcomp "$__git_color_moved_opts" "" "${cur##--color-moved=}"
		return
		;;
	--color-moved-ws=*)
		__gitcomp "$__git_color_moved_ws_opts" "" "${cur##--color-moved-ws=}"
		return
		;;
	--ws-error-highlight=*)
		__gitcomp "$__git_ws_error_highlight_opts" "" "${cur##--ws-error-highlight=}"
		return
		;;
	--*)
		__gitcomp "$__git_diff_difftool_options"
		return
		;;
	esac
	__git_complete_revlist_file
}

# shows `git diff` completion options for both branches and files
#complete -F _custom_git_diff gd

_custom_git_selective_stash() {
	local message files

	# Parse the optional message flag
	while [[ "$1" ]]; do
		case "$1" in
		-m | --message)
			shift
			message="$1"
			;;
		*)
			echo "Unknown option: $1"
			return 1
			;;
		esac
		shift
	done

	# List modified, staged, and untracked files
	files=$(git status --porcelain=v1 | awk '{print $2}' | fzf --multi --header "Select files to stash (use <SPACE> to select, <ENTER> to confirm)" --preview 'git diff --color=always -- {}')

	if [[ -z "$files" ]]; then
		echo "No files selected. Aborting."
		return 1
	fi

	# Ensure files are properly stashed
	while IFS= read -r file; do
		if [[ -n "$message" ]]; then
			if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
				# File is tracked
				git stash push -m "$message" -- "$file"
			else
				# File is untracked
				git stash push -u -m "$message" -- "$file"
			fi
		else
			if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
				# File is tracked
				git stash push -- "$file"
			else
				# File is untracked
				git stash push -u -- "$file"
			fi
		fi
	done <<<"$files"

	echo "Stashed selected files."
}

#complete -F _custom_git_selective_stash gstp
#complete -F _custom_git_selective_stash gst

# @TODO: Build out rest of Git alias custom completion functions
# custom git branch aliases completion logic
#_custom_git_branch() {}

# custom git apply aliases completion logic
#_custom_git_apply() {}

# custom git remove aliases completion logic
_custom_git_remove() {

	# List modified, staged, and untracked files
	files=$(git status --porcelain=v1 | awk '{print $2}' | fzf --multi --header "Select files to git remove" --preview 'bat {}')

	if [[ -z "$files" ]]; then
		echo "No files selected. Aborting."
		return 1
	fi
	echo "Removed selected files."
}
#complete -F _custom_git_remove grm

# custom git merge aliases completion logic
_custom_git_merge() {
	#	git branch -l | rg -v '\*|main' | awk '{print $1}' | fzf --select-1 --header "Select branch to merge into current working branch" --preview "git diff --stat {} main"
	# shows diffstat b/w FZF spinner branch and current branch
	git branch -l | rg -v '\*|main' | awk '{print $1}' | fzf --exit-0 --select-1 --header "Select branch to merge into current working branch" --preview "git diff --stat {} $(git branch --show-current)"
}
#complete -F _custom_git_selective_stash gm

# custom git add aliases completion logic
_custom_git_add() {

	# List modified, staged, and untracked files
	files=$(git status --porcelain=v1 | awk '{print $2}' | fzf --multi --header "Select files to add" --preview 'bat --color=always -- {}')

	if [[ -z "$files" ]]; then
		echo "No files selected. Aborting."
		return 1
	fi

	# Ensure files are properly stashed
	while IFS= read -r file; do
		if git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
			# File is tracked
			git add -v -- "$file"
		else
			# File is untracked
			git add -- "$file"
		fi
	done <<<"$files"
}
#complete -F _custom_git_add ga
#complete -F _custom_git_add gad
