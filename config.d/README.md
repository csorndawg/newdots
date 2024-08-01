Naming convetion for config.d/ files should be as followed

conf.<tool>[.<tool config file extension>]

Where the <tool config file extension> is added if it exists. 

This will allow me to easily group/find them in code (can just search for the prefix), while still being able to keep the unqiue file extension (need for symlinking to ~/.config/<tool>).

Examples:
  config.procs.toml
  config.cheat.yml
  config.rg.yml
  config.fzf          # no file extension 
