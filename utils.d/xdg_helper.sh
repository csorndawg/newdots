#!/usr/bin/ bash

# FOR SPECIFIC BASEDIRS, we have FUNCTION THAT CREATES XDG APPLICATION SUBDIRECTORY 
mk_data_dir (){

    mkdir -p "$XDG_DATE_HOME/applications"
    touch "$XDG_DATA_HOME/applications/{private,opensource}_apps.list"
}

# create default app directory 
mk_data_app_dir(){
    APP_NAME="$1"
    mkdir -p $XDG_DATA_HOME/$APP_NAME/{config,data,docs,src,lib} 
    mkdir -p $XDG_DATA_HOME/$APP_NAME/data/{raw,interim,out} 
}
    
# standard app dir for XDG_STATE
mk_state_app_dir(){
    APP_NAME="$1"
    mkdir -p $XDG_STATE_HOME/$APP_NAME/{session,cache,logs,tests} 
}


mk_config_dir (){
    APP_NAME="$1"
    makeSymlinks="$2"

    mkdir -p "$XDG_CONFIG_HOME/$APP_NAME"
    touch "$HOME/dotfiles/$APP_NAME.config"

    # if true make generic symlink
    if [[ -z $makeSymlinks ]];
    then 
        ln -sr "$HOME/dotfiles/$APP_NAME.config" "$XDG_CONFIG_HOME/$APP_NAME/config"
    fi
}


# GLOBAL XDG ENV. VARS
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_BIN_HOME="$HOME/.local/bin"

mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_STATE_HOME
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_BIN_HOME
