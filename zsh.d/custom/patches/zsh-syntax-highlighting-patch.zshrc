# personal customizations  for zsh-syntax-highlighting plugin
# ref: https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/docs/highlighters


#### HIGHLIGHTERS

## Main
## ref:  https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md

## Customizing Main Parameters
## TODO: update color for all HL groups starting with CORE_HL, for help see above "main.md" doc

## CORE 
CORE_HL_GROUP=(path default unknown-token)


## Alias HL Group
ALIAS_HL_GROUP=(alias 'suffix-alias' 'global-alias')

## Globbing/Expansion
SHELL_EXPANSIONS_HL_GROUP=(history-expansion globbing)

## "Shell Command HL Group" (all should be same color)
SHELL_COMMANDS_HL_GROUP=()
# command
# builtin  
#commandseparator  # '&&' ';'
#single-hyphen-option   # single hypen flag "-o"
#double-hyphen-option   # "--option"
#assign     # low priority
#command-substitution   
#command-substitution-quoted    
#redirection    # low priority


## OVERRIDING EXAMPLE FROM MAIN.MD 
# Declare the variable
#typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
#ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
# have paths colored instead of underlined
#ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
# disable highlighting of globbing expressions
#ZSH_HIGHLIGHT_STYLES[globbing]='none'

# activate brackets,pattern,cursor , and regex highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp brackets pattern cursor)


## Pattern

# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# To have commands starting with `rm -rf` in red:
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')


## Regexp (like "Pattern" from above but more powerful)
## ref: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/regexp.md

# highlight all lines with red, for commands starting with "rm"
typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('^rm .*' fg=red,bold)


