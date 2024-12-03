# WIP
# ACTIVE/STABLE BASH ALIASES
# UNTESTED/EXPERIMENTAL ALIASES CAN BE FOUND IN lib/expr/aliases.bash

##
## @TODO
## ORGANIZE ALIASES INTO GROUPS/SECTIONS HERE AFTER MIGRATING
## FROM BASHRC_WSL or FROM lib/expr/aliases.bash AFTER BEING TESTED
##

##
## BASHRC_WSL MIGRATED ALIASES
##
alias gmnf="git merge --no-ff"
alias gm="git merge"
#alias gpsu="git push --set-upstream origin"
alias gbd="git branch --delete"
alias nv="nvim"
alias v="vim"
alias vi="vim"
alias gpu="git push -u origin"

# z-like aliases for filesystem jumping
alias jh="cd $HOME/git/jh"
alias zxp="cd $HOME/git/zxp"
alias dob="cd $HOME/git/dataops_bible"
alias dot="cd $HOME/git/newdots"
alias clb="cd $HOME/git/cheatbook"
alias tbx="cd $HOME/git/toolbox"
alias kb="cd $HOME/git/kb2"
alias fkx="cd $HOME/git/fortknox"
alias gwh="cd $HOME/git"

# freq. repos quick actions
alias jhv="vim $HOME/git/jh/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"
alias dotv="vim $HOME/git/newdots/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"
alias clbv="vim $HOME/git/cheatlib/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"
alias fkxv="vim $HOME/git/fortknox/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"
alias tbxv="vim $HOME/git/toolbox/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"
alias kbv="vim $HOME/git/kb2/unsorted/quickadd-$(date +%Y%m%d-%H%M%S).md"

# @TODO - move to rc.d/
alias XARGS="$(which xargs)"
alias xargs='xargs -I "{}"'
alias WSL_CDRIVE="/mnt/c/Users"
alias WSL_ZACCS="/mnt/c/Users/zaccs"
alias WSL_ZCSOR="/mnt/c/Users/zcsor"


## Git Aliases
alias gc="git commit"
alias gca="git commit --amend"
alias gcm="git commit -m "
alias glg="git log --graph --pretty --abbrev-commit"
alias glgg="git log"
alias grs="git restore"
alias grss="git restore --staged"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gad="git add --dry-run"
alias gco="git checkout"
alias gst="git stash"
alias gstl="git stash --list"
alias gsts="git stash --show"
alias gstd="git stash --show --patch"
alias gsta="git stash --apply"
alias gstp="git stash --push --message"
alias gstpp="git stash --push"
alias grb="git rebase "
alias gm="git merge"
alias gcmn="git checkout main"
alias gbl="git branch --list"
alias gbla="git branch --list --all"
alias gbc="git branch --show-current"
alias grm="git remove"
alias gpf="git push -f"
alias gp="git push"
#alias gpu="git push -u origin $(git branch --show-current)"
alias gpu="git push -u origin"
alias grbi="git rebase --interactive"

# page/peak when status too long for terminal
alias gsh="git status | head -n25"
alias gsp="git status | less -RiXj5"

alias gcb="git checkout -b"
alias gpl="git pull"
alias gd="git diff"
alias gds="git diff --stat"
alias gdo="git diff origin"
alias gdos="git diff origin --stat"
alias gdm="git diff origin/main main"
alias gdms="git diff origin/main main --stat"

