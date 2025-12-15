
# FZF wrapper for enabling venvs.
function venvActivate() {
  venvRootDir="$HOME/.config/venvs"

  selectedVenv=$(fd . -a -t f "$venvRootDir" | rg "activate$" | \
      fzf --highlight-line --cycle --select-1 --list-border="sharp")

  # echo "Selected:  $selectedVenv"
  source "$selectedVenv"
}
