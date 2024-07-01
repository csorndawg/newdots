# BASHRC Functions

# TODO: add check to see if cwd within git repo, and if so quit gracefully
gpo (){
    git push -u origin $(git branch --show-current)
}


#
gdfhx (){
    if [ -z "$1" ];
    then
        X=1
    else
        X="$1"
    fi
    git diff HEAD~$X
}
