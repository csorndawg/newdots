## BASHRC env. variables
export python=python3
#export VIMCONFIG="~/.config/nvim"
#export VIMDATA="~/.local/share/nvim"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_VAR_HOME="$HOME/.local/var"

export GH_USERNAME="csorndawg"
export SANDBOXES_HOME_DIR="$HOME/.local/var/sandboxes"

# @TEMPFIX: Setting EDITOR to VIM until autocmd error for open cmd in EDITOR shortcut resolved
# set EDITOR to NVIM, otherwise use VIM as fallback
#if [[ $(which nvim | wc --chars) -le 0 ]]; then
#	export EDITOR="vim"
#else
#	export EDITOR="nvim"
#fi
export EDITOR="vim"

export ANSIBLE_LOCAL_HOME="$HOME/.ansible"
export LOCAL_VAR_HOME="$HOME/.local/var"
export LOCAL_CHEATLIB_HOME="$HOME/git/cheatbook"
export LOCAL_DATAOPS_BIBLE_HOME="$HOME/git/dataops_bible"
export LOCAL_SECRETS_HOME="$HOME/git/fortknox"
export LOCAL_TASKWARRIOR_HOME="$HOME/git/taskwarra"
export LOCAL_KB2_HOME="$HOME/git/kb2"
export LOCAL_DOTFILES_HOME="$HOME/git/newdots"
export LOCAL_ZXPLORE_HOME="$HOME/git/zxp"
export LOCAL_GIT_HOME="$HOME/git"
