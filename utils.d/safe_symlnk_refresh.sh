#!/bin/bash

# Script makes a copy of symlink target (appends ".bk") before overwriting 

# TODO: better arg handling logic 
if [[ -z "$1" ||  -z "$2" ]];
then
    printf "%s\n" "Script not called correctly. See below for correct usage"
	echo "CORRECT USAGE:  <script> <path/to/source/file> <path/to/source/link>"
	exit
else
	SOURCE="$1"
	TARGET="$2"
    printf "\nsource: %s\ntarget: %s\n\n" "$SOURCE" "$TARGET"
fi

# try making symlink, if target exists backup current version 
# before overwriting 
ln -sr "$SOURCE" "$TARGET"  2> /dev/null
if [ $? -ne 0 ]; then
	printf "%s\n" "Target exists -- creating backup"
	cp -vf "$TARGET"{,.bk}
    ln -sfr "$SOURCE" "$TARGET"
fi

printf "\n%s\n" "Created symlink: $SOURCE --> $TARGET"
