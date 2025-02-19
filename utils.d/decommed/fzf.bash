# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zc/.local/work/git/newdots/vim.d/plugged/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zc/.local/work/git/newdots/vim.d/plugged/fzf/bin"
fi

eval "$(fzf --bash)"
