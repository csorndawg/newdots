#
# Custom zsh-only functions
# 


# jump to directory from anywhere via z and create and cd into new subdir 
#zmkd(){
#    Z_PATTERN="$1"
#    NEW_DIR="$2"
#    z "$Z_PATTERN"
#    mkdir -p "$NEWDIR" && cd "$NEWDIR"
#}

# TODO: refactor all non-ZSH dependent functions and move to "rc.d/functions.rc"

# 
#nvim $(cheat -l docker | fzf -m | tr -s ' ' | awk -F ' ' '{print $2}' | xargs -n1 )

# Use FZF to filter and select multiple cheatfiles, all selected 
# cheatfiles will be opened in neovim. Optional cheat filter can be passed 
# to limit the number of inital items sent to FZF.
cheat-browse(){
    CHEAT_FILTER="${1:-''}"
    nvim $(cheat -l "$CHEAT_FILTER" | fzf -m -1 -0 | tr -s ' ' | awk -F ' ' '{print $2}')
}


# fshow_preview - git commit browser with previews
fshow_preview() {

    # configure command and its arguments
    alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
    _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"

    # run the previewer
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

# DOCKER x. FZF
# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
