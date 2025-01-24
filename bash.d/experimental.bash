## EXPERIMENTAL/INTERIM CHANGES THAT CAN EASIER BE EXPANDED/ROLLBACK UNTIL LONGTERM SOLUTION READY
# @EXPERIMENTAL: add smart and selective git stash awareness while working on longterm solution w/ fzf_comp
git_selective_stash() {
  local message files

  # Parse the optional message flag
  while [[ "$1" ]]; do
    case "$1" in
      -m|--message)
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
  done <<< "$files"

  echo "Stashed selected files."
}

bind -x '"\ef": fzf_multi_action'  # Alt-F triggers fzf_multi_action
