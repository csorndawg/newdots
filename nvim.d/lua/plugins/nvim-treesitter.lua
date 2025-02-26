return {
  -- { "nvim-treesitter/nvim-treesitter", }

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
           "awk",
           "bash",
           "c",
           "comment",
           "csv",
           "diff",
           "dockerfile",
           "editorconfig",
           "git_config",
           "gitcommit",
           "gitignore",
           "html",
           "http",
           "ini",
           --"jinja",
           "jq",
           "json",
           "just",
           "lua",
           "luadoc",
           "make",
           "markdown",
           "python",
           "query",
           "regex",
           "sql",
           "ssh_config",
           "terraform",
           "tmux",
           "todotxt",
           "toml",
           "vim",
           "vimdoc",
           "xml",
           "yaml",
         --"",
         --"",
         --"" 
        },
          -- sync_install = false,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
}
