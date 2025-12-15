### ========================================================================================================================
### Interim file for bashrc configuration code thats being migrated/copied from other dotfiles repo
### This is an interim solution until I consolidate my dotfiles into their v3 version
### ========================================================================================================================


## ----------------------------------------
## <BASHRC MODULE>.BASH
## ----------------------------------------


## ----------------------------------------
## FUNCTIONS.BASH
## ----------------------------------------
function ...(){
	cd ../..
}
function ....(){
	cd ../../..
}

# perform an action (open/source) on given dotfilerc file
function dotdo() {
  local rcfile="$1"
  local action_flag="$2"
  if [[ -z "$rcfile" || -z "$action_flag" ]]; then
    echo "Error - function requires 2 arguments (dotfile type, action)"
    echo "Valid arguments: v[im], n[vim], b[ash], z[sh], t[mux] // s[ource], o[pen]"
    echo "Example Usage:"
    echo "  dotdo tmux open   # opens tmux.conf"
    echo "  dotdo b s         # sources bashrc"
    return 1
  fi
  # normalize args (lowercase + first char)
  rcfile="${rcfile,,}"     # lowercase
  rcfile="${rcfile:0:1}"   # just first char
  action_flag="${action_flag,,}"
  # map dotfile type → path
  declare -A rcpaths=(
    [b]="$HOME/dotfiles/bash.d/bashrc"
    [n]="$HOME/.config/nvim/init.lua"
    [t]="$HOME/dotfiles/tmux.d/tmux"
    [v]="$HOME/dotfiles/vim.d/vimrc"
    [z]="$HOME/git/newdots/zsh.d/zshrc"
  )
  local rcpath="${rcpaths[$rcfile]}"
  if [[ -z "$rcpath" ]]; then
    echo "Error - unknown dotfile type: $1"
    return 1
  fi
  case "$action_flag" in
    s|source)
      echo "→ sourcing $rcpath"
      # shellcheck source=/dev/null
      source "$rcpath"
      ;;
    o|open)
      local editor="${EDITOR:-vim}"
      echo "→ opening $rcpath in $editor"
      "$editor" "$rcpath"
      ;;
    *)
      echo "Error - unknown action: $2"
      return 1
      ;;
  esac
}


## ----------------------------------------
## SEGUE.BASH
## ----------------------------------------
function launch_jupyter_tlop {
  jupyterApp="$1"      # if unset/not given, lab will be used by default, otherwise notebook
  machineIP="66.228.40.141" 
  jupyterPort="9998"

  if [[ -z $jupyterApp ]]; then
    jupyterApp="lab"
  else
    jupyterApp="notebook"
  fi

  # set url to launch with firefox
  jupyterURL="http://$machineIP:$jupyterPort/$jupyterApp"
  echo "firefox --new-window  $jupyterURL"

  # detect session type and set when launching Firefox command
  local firefoxCmd
  if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    firefoxCmd="env MOZ_ENABLE_WAYLAND=1 firefox --new-window $jupyterURL"
  else
    firefoxCmd="env MOZ_ENABLE_WAYLAND=0 firefox --new-window $jupyterURL"
  fi

  firefox --new-window  "$jupyterURL" 2> /dev/null
}

alias xclipc="xclip -selection clipboard"

# cd stack navigator helper function
dot_cd() {
    local n=${#1}        # number of dots
    if (( n == 2 )); then
        cd ..
    elif (( n == 3 )); then
        cd ../..
    elif (( n == 4 )); then
        cd ../../..
    elif (( n >= 5 && n <= 10 )); then
        cd "$HOME"
    else
        printf "Invalid dot sequence: '%s'\n" "$1"
        return 1
    fi
}

# recent dir stack manger util 
# td: store current absolute directory into td1, td2, or td3
td() {
    local idx="1"
    # if user passed "2" or "3", use that
    if [[ "$1" == "2" || "$1" == "3" ]]; then
        idx="$1"
    elif [[ -n "$1" ]]; then
        printf 'td: invalid argument "%s" (only 2 or 3 allowed)\n' "$1" >&2
        return 1
    fi
    # get canonical absolute path
    local path
    path="$(pwd -P)"
    # assign dynamically to td1/td2/td3
    printf -v "td${idx}" '%s' "$path"
}
