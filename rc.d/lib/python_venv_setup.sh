#!/usr/bin/env bash

# pre-configuration requirements
function function_name() {
  VENVS_HOME_DIR="$HOME/.local/state/python/venvs"
}

# generate handful of core (system-wide, shell independent)
function gen_core_venvs {
  CORE_VENVS_LIST=(venv shellGPT_venv venv_shellGPT debuggy_venv)
  for v in ${CORE_VENVS_LIST[@]}; do 
    VENV_BASE_DIR="$VENVS_HOME_DIR/$v"
    if [[ ! -d "$VENV_BASE_DIR" ]]; then
      python3 -m venv "$VENV_BASE_DIR"
    fi
  done
}

function debuggy_syml {
  SYML_TARG_DEBUGGY_VENV="$1"
  SYML_SRC_DEBUGGY_VENV="$VENVS_HOME_DIR/debuggy_venv"
  ln -sr $SYML_SRC_DEBUGGY_VENV $SYML_TARG_DEBUGGY_VENV && echo "1"
}

function gen_debuggy_alias {
  TARG_DEBUGGY_DIR="$1"
  DEBUGGY_SYML="$(debuggy_syml "$TARG_DEBUGGY_DIR")"
  if [[ "$DEBUGGY_SYML" == 1 ]]; then
    alias debuggy_on="activate $HOME/$TARG_DEBUGGY_DIR/bin/activate"
  fi
}

# Aliases/Exports/Functions with dependencies on above pre-configuration
# This is stuff I want to be active when its sourced bashrc/zshrc and continue
# on until shell session terminates

gen_debuggy_alias "$HOME/.venv"
