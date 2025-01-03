# SKELETON SCRIPT FOR BOOTSTRAPING CHEATFILES POST-INSTALL SETUP/CONFIG
# WILL BE USED TO HANDLE THINGS LIKE SYMLINKS, EXPECTED LOCATIONS, ETC.

# `fc` history dump for commands used when creating setup
# NOTE: as of now I only have 2 custom directories - `work` and `unsorted`
# `work` is the default and contains both WIP and pristine cheatfiles
# `unsorted` holds everything else
#   some examples include:
#     files that dont follow cheat file convention (eg. markdown file)
#     shell command dumps
#     anything else
#

# start of script (clb is shell alias)
clb
cd tools/cheat/cheatfiles/
pwd
cheatFilesDir="$(pwd)"
echo "cheatFilesdir: $cheatFilesDir"
cd
ln -sr "$cheatFilesDir" .cheatFilesHome
mkdir -p $XDG_DATA_HOME/cheat/
ln -sr "$cheatFilesDir" " $XDG_DATA_HOME/cheat/cheatfiles"
ln -sr "$cheatFilesDir" "$XDG_DATA_HOME/cheat/cheatfiles"
