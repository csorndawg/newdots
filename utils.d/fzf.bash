# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zc/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zc/.fzf/bin"
fi

eval "$(fzf --bash)"
