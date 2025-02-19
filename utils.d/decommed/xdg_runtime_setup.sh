#!/usr/bin/env bash

# All runtime config/source (aka upstream) data lives in XDG_RUNTIME_HOME 
# To override/extend default behavior for a script, define the updated 
# parameters (whats being overwritten) in a file within a RUNTIME/confs (extending/overwriting parameters/behaviors) 
# or RUNTIME/srcs (raw, unmodified source data) directory. 
# 
# This applies for known $PATH scripts (eg. version controlled scripts) as well
# as adhoc scripts. 
#
# For adhoc scripts place them within a RUNTIME/{confs,srcs}.locald directory 
#

function mk_xdg_runtime_dirs {
  echo mkdir -p $HOME/.local/runtime/{confs,srcs,tmp}.{,locald}
  mkdir -p $HOME/.local/runtime/{confs,srcs,tmp}{,.locald}
}

mk_xdg_runtime_dirs
