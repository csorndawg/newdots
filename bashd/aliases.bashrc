# BASHRC aliases

# use neovim instead of vim/vi
alias vim=nvim
alias vi=nvim

## =======================================
##  OLD ALIAS DUMP
## =======================================


## WORKFLOW ALIASES WIP
alias gs="git status"
alias gcb="git checkout -b "
alias gcm="git checkout main "
alias gcmt="git commit "
alias gcmn="git checkout main "
alias grb="git rebase -i HEAD~$1"
alias glg="git log "
alias glgn="git log -n"
alias ga="git add"
alias gpl="git pull "
alias gp="git push "
alias gpf="git push --force "
alias gdf="git diff "
alias gdfm="git diff main"
alias gdfh="git diff HEAD~1"
alias gdfs="git diff --staged "
alias grs="git restore "
alias grss="git restore --staged "
alias gbl="git branch --list"
alias gco="git checkout "
alias gcmsg="git commit -m"



# tmux 
alias tmls='tmux ls'
alias tmshb="tmux show-buffer"
alias tmsvb="tmux save-buffer"
alias tmstb="tmux set-buffer"
alias tmab="tmux save-buffer -a"
alias tmcb="tmux choose-buffer"
alias tmpb="tmux paste-buffer"
alias tmsk="tmux send-keys "
alias tmnw="tmux new-window -t"
alias tmnwn="tmux new-window -n "
alias tmds="tmux detach"
alias tmas="tmux attach"


# general 
alias eg=egrep
alias egv="egrep -v"
alias rgv="rg -v"
alias a=alias
alias ag="alias | egrep "
alias h="history"
alias ag="history | egrep "

# cron
alias cte="crontab -e"
alias ctl="crontab -l"


## preliminary/ideas

# write buffer to new file
alias tmuxDumpBufferNew="tmux save-buffer $HOME/.local/state/tmux/session/bufferDump.$(date +%Y%m%d_%H%M%S).txt"
# appends exists
alias tmuxDumpBufferExisting="tmux save-buffer -a $HOME/.local/state/tmux/session/bufferDumps.txt"

# NOTE: for personal aliases like above use camelcase for aliases to distinguish from "traditional" ones like the above git aliases


# general 
alias varnotes="cd ~/.local/var/notes"
alias sourceZSHRC="source $HOME/.zshrc "
alias sourceVIMRC="source $HOME/.vimrc "
alias historyLog="echo $(history |tail -n2 | head -n1) | tee $HOME/.local/state/history/command_history_dumps.txt"

