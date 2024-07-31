# ========================================================================
# 	ALIASES
# ========================================================================

# TODO: move zshrc/bashrc aliases below

## WORKFLOW ALIASES WIP
alias gs="git status"
alias gcb="git checkout -b "
alias gcmn="git checkout main "
alias gcmt="git commit -m "
alias gcmn="git checkout main "
alias grb="git rebase -i HEAD~$1"
alias grb2='git rebase -i HEAD~'"$1"
alias ga="git add"
alias gpl="git pull "
alias gp="git push "
alias gpf="git push --force "
alias gdf="git diff "
alias gdfm="git diff main"
alias gdfh="git diff HEAD~1"
alias gdfs="git diff --staged "
alias grs="git restore "$1
alias grss="git restore --staged "
alias gpo="git push -u origin $(git branch --show-current)"


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


##################################################
# suffix aliases 
##################################################
#
# run given alias for certain filetypes, if no shell command specified
# specified by passing "-s" flag to alias
#
# if no command given, open all markdown extension files in vim
# e.g  $ somefile.md        ## `vim somefile.md` ran b/c no command specified 
# but  $ bat somefile.md    ## runs bat command

alias -s sh=bash        # run bash <file>.sh unless otherwise noted
alias -s {txt,json,md,py}=vim       # all file types on left opened in vim


##################################################
# functions for aliases with parameters
##################################################
#
# unlike bash, it looks like zsh allows for aliases to include parameters 
# including the below as a reference example for future 
#
# syntax:
#   aliasname(){
#       <command> $<first parameter> $<second parameter>
#   }
#

aliaswithparameters_test(){
    echo 'the following args were passed to the aliases:  '$1' , '$2
}


##################################################
# global aliases
##################################################
# 
# override all other aliases with the same name
# defined by the `-g` flag
# example:  alias -g <alias name>="<alias command>"



##################################################
# general aliases
##################################################
#

# general
alias sbx="cd $HOME/git/ongoing/toolbox/wips/playground/sandboxes"
alias vsbx="vim $HOME/git/ongoing/toolbox/wips/playground/sandboxes/default/sandbox_$(date +%Y%m%d_%H%M%S_%Z)"
alias vvsbx="vim $HOME/git/ongoing/toolbox/wips/playground/sandboxes"
alias qt="vim $HOME/.local/tmp/quick"
alias qvt="vim $HOME/.local/var/tmp/quick"
alias a="alias"
alias ag="alias | rg"
alias h="history"
alias hg="history | rg "
alias eg=egrep
alias egv="egrep -v "
alias rgv="rg -v "
alias D="diff"
alias V="/usr/local/bin/vim"
alias v="/usr/local/bin/vim"
alias vim="nvim"
alias nv="nvim"
alias lvim="$XDG_BIN_HOME/lvim"
alias lunarvim="$XDG_BIN_HOME/lvim"

# prelim
alias xargsi='xargs -I "{}" '
alias t="cd $HOME/.toolbox"
alias c="cd $HOME/.cheatsheets"
alias cfg="cd $HOME/.config"
