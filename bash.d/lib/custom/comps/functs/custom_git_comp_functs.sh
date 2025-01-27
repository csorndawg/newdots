#!/usr/bin/env bash

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
complete -F _custom_git_diff gd
