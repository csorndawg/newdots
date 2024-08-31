
-- ---------------------------------------------------
--   bootstrap lazy.nvim 
-- ---------------------------------------------------

-- lazy config install 
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- must set leader/local leader before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- lazy.nvim setup
require("lazy").setup({
  spec = {
    -- import all plugins (plus their configurations) defined 
    -- in nvim/lua/plugins.lua
    { import = "plugins" },
  },
})

-- -----------------------------------------------------------------
--  source custom nvim config submodules 
--   - source after lazy to avoid overwriting personal configuration
--  
--  enable configurations/functionality from any plugin defined 
--  from any plugin defined in lua/plugins/ below
-- -----------------------------------------------------------------

-- @EXPERIMENTAL 
-- test experimental configurations (plugin, opt, remap, etc.)
--require("user.experimental")
require("config.opts")
require("config.keymaps")
--require("config.autocmds")
--require("user.lazy_remaps")     -- load custom plugin remaps


-- set Nord theme for colorscheme/lualine/bufferline to Nord
vim.cmd("colorscheme nord")

require('lualine').setup({
  options = { theme = 'nord' }
})

require("bufferline").setup({
    options = {
        separator_style = "thin",
        theme = 'nord',
    },
})


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- 
-- -- -- LSP/MASON
-- -- 
-- -- require("mason-lspconfig").setup {
-- --     -- add dockerls, docker_compose_language_service, jsonls, marksman, awk_ls
-- --     -- sqlls, glint, etc. after getting base cases set up
-- -- ensure_installed = { "lua_ls", "bashls", "vimls" , "yamlls" },
-- -- }
-- -- 
-- -- -- Python 
-- -- require'lspconfig'.pyright.setup{}
-- -- 
-- -- 
-- -- -- Vim
-- -- require'lspconfig'.vimls.setup({
-- -- 	diagnostic = {
-- --         enable = true
-- -- 	  },
-- -- 	  indexes = {
-- -- 		count = 3,
-- -- 		gap = 100,
-- -- 		projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
-- -- 		runtimepath = true
-- -- 	  },
-- --       isNeovim = true,
-- -- 
-- -- runtimepath = "",
-- --   suggest = {
-- --     fromRuntimepath = true,
-- --     fromVimruntime = true
-- --   },
-- --   vimruntime = ""
-- -- })
-- -- 
-- -- 
-- -- -- -- BASH
-- -- -- require'lspconfig'.bashls.setup({
-- -- -- 	filetypes = { "sh", "bash", "bashrc" }
-- -- -- })
-- -- -- 
-- -- -- -- YAML
-- -- -- 
-- -- -- 
-- -- -- -- Docker/Docker Compose
-- -- -- require'lspconfig'.docker_compose_language_service.setup{}
-- -- -- require("lspconfig").dockerls.setup {
-- -- --     settings = {
-- -- --         docker = {
-- -- -- 	    languageserver = {
-- -- -- 	        formatter = {
-- -- -- 		    ignoreMultilineInstructions = true,
-- -- -- 		},
-- -- -- 	    },
-- -- -- 	}
-- -- --     }
-- -- -- }
-- -- -- 
-- -- -- 
-- -- -- 
-- -- -- -- Ansible
-- -- -- require'lspconfig'.ansiblels.setup({
-- -- -- filetypes = {"yaml.ansible"},
-- -- -- })
-- -- -- 
-- -- -- 
-- -- -- -- SQL (all non-postgres flavors)
-- -- -- require'lspconfig'.sqls.setup({
-- -- --   cmd = {"path/to/command", "-config", "path/to/config.yml"},
-- -- --   filetypes = {"sql","mysql"},
-- -- -- })
-- -- -- 
-- -- -- -- POSTGRES
-- -- -- require'lspconfig'.postgres_lsp.setup{}
-- -- -- 
-- -- -- -- LUA
-- -- -- require'lspconfig'.lua_ls.setup {
-- -- --   on_init = function(client)
-- -- --     local path = client.workspace_folders[1].name
-- -- --     if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
-- -- --       return
-- -- --     end
-- -- -- 
-- -- --     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
-- -- --       runtime = {
-- -- --         -- Tell the language server which version of Lua you're using
-- -- --         -- (most likely LuaJIT in the case of Neovim)
-- -- --         version = 'LuaJIT'
-- -- --       },
-- -- --       -- Make the server aware of Neovim runtime files
-- -- --       workspace = {
-- -- --         checkThirdParty = false,
-- -- --         library = {
-- -- --           vim.env.VIMRUNTIME
-- -- --           -- Depending on the usage, you might want to add additional paths here.
-- -- --           -- "${3rd}/luv/library"
-- -- --           -- "${3rd}/busted/library",
-- -- --         }
-- -- --         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
-- -- --         -- library = vim.api.nvim_get_runtime_file("", true)
-- -- --       }
-- -- --     })
-- -- --   end,
-- -- --   settings = {
-- -- --     Lua = {}
-- -- --   }
-- -- -- }
-- -- -- 
-- -- -- 
-- -- -- 
-- -- -- -- TREESITTER
-- -- -- -- lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}  " At the bottom of your init.vim, keep all configs on one line
-- -- -- --require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
-- -- -- --
-- -- -- 
-- -- -- 
