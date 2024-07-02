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

## RSYNC HELPER FUNCTIONS

## rsync dir - dryrun
rsdd (){
    #echo "rsync --dry-run -azvphr"
    rsync --dry-run -azvphr $1 $2
}
## rsync dir - execute
rsdx(){
    rsync -azvphr $1 $2
}
## rsync file - dryrun
rsfd (){
    rsync --dry-run -azvph $1 $2
}
## rsync file - execute
rsfx(){
    rsync -azvphr $1 $2
}


mcd (){
    DIRPATH="$1"
    mkdir -p $DIRPATH && cd $DIRPATH
}
