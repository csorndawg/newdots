# BASHRC aliases

# use neovim instead of vim/vi
if [[ -z "/usr/bin/nvim" || -z "$HOME/.local/bin/nvim" ]];
then
    echo "Neovim binary found. Creating nvim 'vim' alias"
    #alias vim="nvim"
    #alias vi="nvim"
fi


## =======================================
##  OLD ALIAS DUMP
## =======================================


## WORKFLOW ALIASES WIP
alias ga="git add"
alias gbl="git branch --list"
alias gcb="git checkout -b "
alias gcm="git commit"
alias gcmn="git checkout main "
alias gcmsg="git commit -m"
alias gco="git checkout "
alias gd="git diff "
alias gdf="git diff "
alias gdfh="git diff HEAD~1"
alias gdfo="git diff origin"
alias gdfc="git diff --compact-summary"
alias gdfs="git diff --staged "
alias gdfcs="git diff --compact-summary --staged "
alias glg="git log "
alias glgo="git log --oneline"
alias glgn="git log -n"
alias gmr="git merge "
alias gp="git push "
alias gpf="git push --force "
alias gpl="git pull "
alias grb="git rebase "
alias grbi="git rebase -i "
alias grbsq="git rebase -i --autosquash"
alias grs="git restore "
alias grss="git restore --staged "
alias gs="git status"
alias gss="git status -s"
alias gsth="git stash"
alias gstha="git stash apply "
alias gsthl="git stash list"
alias gsthp="git stash push"
alias gcmf="git commit --fixup "


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
alias eg="egrep"
alias egv="egrep -v"
alias rgv="rg -v"
alias a="alias"
alias ag="alias | egrep "
alias h="history"
alias hg="history | egrep "
alias xargsi='xargs -I "{}"'
alias trup="tr [:lower:] [:upper:]"
alias trlow="tr [:upper:] [:lower:]"

# cron
alias cte="crontab -e"
alias ctl="crontab -l"

alias q="cd ~/git/quarry"
alias dots="cd ~/dotfiles"

## preliminary/ideas

# write buffer to new file
alias tmuxDumpBufferNew="tmux save-buffer $HOME/.local/state/tmux/session/bufferDump.$(date +%Y%m%d_%H%M%S).txt"
# appends exists
alias tmuxDumpBufferExisting="tmux save-buffer -a $HOME/.local/state/tmux/session/bufferDumps.txt"

# NOTE: for personal aliases like above use camelcase for aliases to distinguish from "traditional" ones like the above git aliases


# general 
alias varnotes="cd ~/.local/var/notes"
#alias sourceZSHRC="source $HOME/.zshrc "
alias sourceBASHRC="source $HOME/.bashrc "
alias sourceVIMRC="source $HOME/.vimrc "
alias sourceNVIMRC="source $HOME/.config/init.vim "
alias historyLog="echo $(history |tail -n2 | head -n1) | tee $HOME/.local/state/history/command_history_dumps.txt"


alias gds="git diff --summary"
alias gf="git fetch"
alias gd="git diff"
alias gad="git add --dry-run"
alias gdm="git diff main"
alias gm="git merge "
alias gco="git checkout"
alias gbl="git branch --list"
alias grb="git rebase"
alias gc="git commit"
alias gst="git stash"
