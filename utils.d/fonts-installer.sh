#!/usr/bin/env bash

# install select Nerd fonts

# var
FONTS_LOCAL_DIR="$HOME/.local/share/fonts"

function setup_fonts_dir() {
  if [ ! -d "$FONTS_LOCAL_DIR" ]; then
    mkdir -p "$FONTS_LOCAL_DIR"
  fi
}

function download_fonts() {
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/UbuntuMono.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
}

# @TODO: add logic to UNZIP downloads
# @NOTE: .OTF > .TTF 
# Look into parsing zip for select .OTF flavors to avoid bloat from unused/extra fonts from the raw download

# @FONTS SETUP BETTER: get name of font group from download zip basename. Take that store as variable, use var to make local dir, unzip downloaded zip to newly made dir to avoid tarbomb.
