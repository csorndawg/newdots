-- for more see: https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting

-- treeshitter syntax-highlighting
lvim.builtin.treesitter.ensure_installed = {
  "bash",
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
  "make",
  "markdown",
  "python",
  "regex",
  "sql",
  "ssh_config",
  "tmux",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}


-- setup formatter for bash/python
-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = false
lvim.format_on_save.pattern = { "*.py" }


-- setup linter bash/python/yaml
-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

