# source bash completion files defined in completers subdir

COMPLETERS_LIB="$HOME/dotfiles/bashd/completers"
find "$COMPLETERS_LIB" -type f -path "*.completers" -exec echo source {} \;


## test LIB path valid, has at least 1 non empty file
if [[ ! -d "$COMPLETERS_LIB" ]];
then
    # exit script after echo with error
    echo "Bash completion lib at $COMPLETERS_LIB does not exist. No completions scripts will be sourced."
    exit 1

else
    echo ""
    echo "At least 1 non-empty completion module present in library."
    #for completer in $(find "$COMPLETERS_LIB" -type f  -name "*.completer" );
    #find "$COMPLETERS_LIB" -mindepth 2 -type f   -exec echo sourcing {} now \;
    #find "$COMPLETERS_LIB" -type f -path "*.completers" -exec source {}
    
fi