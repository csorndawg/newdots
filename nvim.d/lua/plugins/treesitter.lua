return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
              "awk",
              "bash",
              "comment",
              "csv",
              "diff",
              "dockerfile",
              "gitcommit",
              "gitignore",
              "html",
              "json",
              "lua",
              "lua",
              "luadoc",
              "make",
              "markdown",
              "python",
              "query",
              "regex",
              "sql",
              "tmux",
              "todotxt",
              "toml",
              "vim",
              "vimdoc",
              "xml",
              "yaml",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { 
		  enable = true,
		  disable = { "yaml", "python" }
	  }, 
        })
      end
   },
}
