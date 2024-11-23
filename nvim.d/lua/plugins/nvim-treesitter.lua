return {
  -- { "nvim-treesitter/nvim-treesitter", }

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
           "bash",
           "c",
           "csv",
           "diff",
           "dockerfile",
           "git_config",
           "gitcommit",
           "gitignore",
           "html",
           "ini",
           "jq",
           "json",
           "lua",
           "python",
           "regex",
           "sql",
           "ssh_config",
           "toml",
           "vim",
           "vimdoc",
           "xml",
           "yaml",
         --"",
         --"",
         --"" 
        },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
}
