# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shelby-sensation/.vim/plugged/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/shelby-sensation/.vim/plugged/fzf/bin"
fi

source <(fzf --zsh)
