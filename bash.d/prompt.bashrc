## Improved bash prompt
## Note: For future changes test with bash-prompt-generator tool 
## Source: https://bash-prompt-generator.org/

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\n\[\e[38;5;115m\]\u@\h\n\[\e[38;5;152m\]\w\[\e[0m\]  \[\e[38;5;223;3m\]${PS1_CMD1}\[\e[0m\]  \n \[\e[38;5;139;3m\]>\[\e[0m\] '
