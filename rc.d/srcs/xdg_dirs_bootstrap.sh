#!/usr/bin/env bash

# xdg base dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DOWNLOADS_HOME="$HOME/.local/var/data/downloads"

# custom XDG local dirs
export XDG_TMP_HOME="$HOME/.local/tmp"
export XDG_VAR_HOME="$HOME/.local/var"
export XDG_VAR_TMP_HOME="$HOME/.local/var/tmp"
export XDG_RUNTIME_HOME="$HOME/.local/runtime"

# @DEPENDENCIES: XDG base/custom dir
# XDG DEPENDENCIES/SUBDIRS
export CRONTAB_LOGS_HOME="$XDG_VAR_HOME/log/cron"

# @TODO: Refactor XDG logic into a function that creates and exports all
# XDG Variables from a single bash function, that will be ported/sourced by my dotfiles.
#
# Runtime Files: Files evoked at runtime that impact execution/results
# of a script or app. As of now "srcs" and "conf" are the only use case
# folders.
# 	- "srcs" is  for RAW UNCONFIGURABLE/UNEXTENSIBLE SOURCE DATA/DATA FILES (think upstream data in a data pipeline)
# 	- "conf" is  for EXTENSIBLE/CONFIGURABLE SOURCE FILES (think zshrc/custom/patches/ files, db config file, etc.)
#
#
# The "other" and "tmp" were added as catch-all folders for future usage outside "srcs" and "conf".
#
mkdir -pv $XDG_RUNTIME_HOME/{srcs,conf,other,tmp}
