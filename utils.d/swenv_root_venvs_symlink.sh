#!/usr/bin bash


# "master" swenv dirpath
UV_SRC_DIR="$venvs/uvv/"

# symlink src dirs
PY_VENVS_DIR="$HOME/.local/state/python/venvs"
SHELLGPT_DIR="$HOME/.shellGPT/shellGPT_venv"


# symlink to TARG (master swenv dir)

ln -sr "$(pwd)" "$UV_SRC_DIR/python_state"
ln -sr "$SHELLGPT_DIR" "$UV_SRC_DIR/shellgpt_venv"
