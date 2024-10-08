-- ~/.config/nvim/lua/plugins/null-ls.lua
return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({

      -- @TODO: cleanup code within 'sources' sub-table - group by lang. if possible
      sources = {
        -- Python linters
        null_ls.builtins.diagnostics.flake8,

        -- Python formatters
        null_ls.builtins.formatting.black,

        -- Bash linters
        null_ls.builtins.diagnostics.shellcheck,

        -- Bash formatters
        null_ls.builtins.formatting.shfmt,

        -- Lua formatter
        null_ls.builtins.formatting.stylua,


        -- YAML
        -- yaml linter
        null_ls.builtins.diagnostics.yamllint,

        -- yaml formatter
        null_ls.builtins.formatting.yamlfmt,

        -- ADHOC
        -- null_ls.builtins.completion.spell,



        -- @TODO:
        --  * Linters
          -- null_ls.builtins.diagnostics.zsh
          -- null_ls.builtins.diagnostics.codespell
          -- null_ls.builtins.diagnostics.luacheck
          -- null_ls.builtins.formatting.sqlfluff.with({
          --    extra_args = { "--dialect", "postgres" }, -- change to your dialect
        --
        --  * FORMATTERS
          --  null_ls.builtins.formatting.stylua
          -- jupytext/jq/marksmen/etc.
      },
    })

    -- Auto format on save for Python and Bash files
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.py", "*.sh" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

