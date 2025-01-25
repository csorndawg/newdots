-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.

local mason = require('mason').setup()



if mason then
    
  -- SETUP SELECT LSP SERVERS WITH MASON
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

    -- @NOTE: TEST LSP GROUP
    -- ... pyright, taplo, dockerls, yamlls, ansiblels, bashls, docker_compose_language_service
    ansiblels = {},
    bashls = {},
    --    @FIX: Uncomment after testing
--    docker_compose_language_service = {},
--    dockerls = {},
--    pyright = {}, 
--    vim-language-server = {},
--    yamlls = {},


    -- DEFINE SELECT LSP SERVERS LIST
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
  -- @IMPORTANT: RUN ENSURE INSTALLED ON DEFINED LSP SERVER LIST
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    --'stylua', -- Used to format Lua code
  })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  -- @TODO: Setup Linters
  -- SETUP SELECT LINTERS WITH MASON
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

  -- @FIX: TEST if below correct way to pass debugger list to EXISTING/RUNNING  MASON_ENSURE_INSTALL_LIST (master list with all MASON CODE OFFERINGS)
  -- @TESTME
  vim.list_extend(ensure_installed, {debuggers})
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

end
