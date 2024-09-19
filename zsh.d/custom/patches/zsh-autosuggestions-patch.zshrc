## CUSTOMIZING ZSH_AUTO 

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# prettier highlighting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#60728A"    # gray5

# <Alt>a accepts but doesnt execute suggestion
bindkey '^[a' autosuggest-accept 

# <Alt>x accepts AND executes suggestion
bindkey '^[x' autosuggest-execute 

# <Alt>/ partially accepts suggestion 
bindkey '^[/' forward-word
