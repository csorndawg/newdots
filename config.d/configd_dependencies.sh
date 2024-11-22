
# Ongoing script for creating config.d symlinks

## vars
DOTFILES_HOME="$HOME/dotfiles"
CONFIGD_HOME="$DOTFILES_HOME/config.d"
DIRCOLOR="nord" # colorscheme file to enable

## setup config.d symlink
ln -sr "$CONFIGD_HOME/dircolors" "$HOME/.config./dircolors"

## set color 
if [ -f "$HOME/.config.d/dircolors/$DIRCOLOR" ]; then
    echo eval "$(dircolors $HOME/.config.d/dircolors/DIRCOLOR)" | tee -a $HOME/.bashrc
    eval "$(dircolors $HOME/.config.d/dircolors/DIRCOLOR)"
fi

