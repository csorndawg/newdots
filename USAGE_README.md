All executable files are stored in top level of `executables/` directory. Directory has  (or will have) `src`, `lib`, `config` directories that also are version controlled. These dirs mirror the Linux FHS equivalents. 

`lib/`: custom, portable code libraries for Bash/Python/SQL

`src/`: runtime files that can impact script behavior, but not logic (e.g. raw data file  for a python data pipeline job"

`config/`: configuration file for executable script, follow `<executable name>.config` naming convention



Also, add a script to generate symlinks for executables from repo to `XDG_BIN_HOME` to ensure executable is on path and has correct permissions.
