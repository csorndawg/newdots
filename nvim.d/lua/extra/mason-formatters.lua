-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.

local mason = require('mason').setup()



if mason then
    
  -- You can add other tools here that you want Mason to install
  -- for you, so that they are available from within Neovim.
  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    -- ts_ls = {},
    --

    lua_ls = {
      -- cmd = {...},
      -- filetypes = { ...},
      -- capabilities = {},
--      settings = {
--	Lua = {
--	  completion = {
--	    callSnippet = 'Replace',
--	  },
--	  -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--	  -- diagnostics = { disable = { 'missing-fields' } },
--	},
--      },
    },
  }

  -- @TODO: Setup Linters
  local linters = {
    -- <python linters(s)>
    -- <bash linters(s)>
    -- <sql linters(s)>
    -- <X linters>
  }


  -- @TODO: Setup Formatters
  local formatters = {
    -- <python formatter(s)>
    -- <bash formatter(s)>
    -- <sql formatter(s)>
    -- <X formatter>
  }

  -- @TODO: Setup Debuggers
  local debuggers = {
    -- <python debugger(s)>
    -- <bash debugger(s)>
    -- <sql debugger(s)>
    -- <ansible debugger(s)>
    -- <X debugger>
  }

  -- @FIX: Not broke but needs testing after above finished
  -- Ensure above Mason/Lsp stuff installed
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua', -- Used to format Lua code
  })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

end
