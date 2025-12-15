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
#alias gpsu="git push --set-upstream origin"
alias nv="nvim"
alias v="vim"
alias vi="vim"

# z-like aliases for filesystem jumping
alias jh="cd $HOME/git/jh"
alias zxp="cd $HOME/git/zxp"
alias twa="cd $HOME/git/taskwarra"
alias dob="cd $HOME/git/dataops_bible"
alias dot="cd $HOME/git/newdots"
alias obb="cd $HOME/git/obsiddy"
alias chtr="cd /home/tlop/git/cheatfiles-zc"
alias clbo="cd $HOME/git/cheatbook"
alias tbx="cd $HOME/git/toolbox"
alias kb="cd $HOME/git/kb2"
alias fkx="cd $HOME/git/fortknox"
alias gwh="cd $HOME/git"
alias wkd="cd $HOME/work/scratch"

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

# convenience aliases
alias tll=tldr
alias cb="cd $HOME/mycodebase"
alias xcc="xclip -se clipboard"  # sends pipeline output to system clipboard
alias clip="xclip -se clipboard"  # sends pipeline output to system clipboard
