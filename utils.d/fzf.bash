# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zc/.vim/plugged/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zc/.vim/plugged/fzf/bin"
fi

eval "$(fzf --bash)"
