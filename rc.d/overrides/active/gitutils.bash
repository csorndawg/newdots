# Git shell utility scripts

# fgd: git diff <fzf-selected-branch> <current-branch>
fgd() {
  local current_branch=$(git branch --show-current)
  local selected_branch=$(git branch -a |
    grep -v HEAD |
    sed 's/^[* ] //' |
    sed 's#remotes/[^/]*/##' |
    sort -u |
    fzf --prompt="Compare with current ($current_branch): " --select-1)

  if [[ -n "$selected_branch" ]]; then
    git diff "$selected_branch" "$current_branch"
  else
    echo "No branch selected."
  fi
}

# fgd2: git diff <current-branch> <fzf-selected-branch>
fgd2() {

  local current_branch=$(git branch --show-current)
  local selected_branch=$(git branch -a |
    grep -v HEAD |
    sed 's/^[* ] //' |
    sed 's#remotes/[^/]*/##' |
    sort -u |
    fzf --prompt="Compare current ($current_branch) to: " --select-1)

  if [[ -n "$selected_branch" ]]; then
    git diff "$current_branch" "$selected_branch"
  else
    echo "No branch selected."
  fi
}
