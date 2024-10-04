# BASH/CYGWIN-ONLY FUNCTIONS
# ----------------------------

FDF(){
    SEARCH_PATTERN="$1"
    ABS_PATH="$2"
    # echo help if requirement missing
    if [[ -z $SEARCH_PATTERN ]]; then
        echo ""
        echo 'Error: <SEARCH_PATTERN> argument is missing'
        echo 'Command Syntax: fdf <SEARCH PATTERN> [ABS_PATH]'
    # optional ABS_PATH given
    elif [[ -z $2 ]]; then
        find $ABS_PATH -type f | egrep $1
    else
        find -type f | egrep $1
    fi
}

FDD() {
    SEARCH_PATTERN="$1"
    ABS_PATH="$2"
    # echo help if requirement missing
    if [[ -z $SEARCH_PATTERN ]]; then
        echo ""
        echo 'Error: <SEARCH_PATTERN> argument is missing'
        echo 'Command Syntax: fdf <SEARCH PATTERN> [ABS_PATH]'
    # optional ABS_PATH given
    elif [[ -z $2 ]]; then
        find $ABS_PATH -type f | egrep $1
    else
        find -type f | egrep $1
    fi
}

##
## @TODO: rsync helpers
##
