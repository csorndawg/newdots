
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
    --{ import = "plugins" },
    { import = "plugins" },
  },
})

-- -----------------------------------------------------------------
--   source custom nvim config submodules (source after lazy to 
--   avoid overwriting personal configuration)
-- -----------------------------------------------------------------

-- 3 modules below were moved to lua/config and are now sourced 
-- by Lazy automatically (https://www.lazyvim.org/configuration/general)
--require("user.opts")
--require("user.autocmds")
--require("user.keymaps")

-- @EXPERIMENTAL 
-- test experimental configurations (plugin, opt, remap, etc.)
--require("user.experimental")
require("user.lazy_remaps")     -- load custom plugin remaps

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


require("mason-lspconfig").setup {
    -- add dockerls, docker_compose_language_service, jsonls, marksman, awk_ls
    -- sqlls, glint, etc. after getting base cases set up
ensure_installed = { "lua_ls", "bashls", "vimls" , "yamlls" },
}

require'lspconfig'.pyright.setup{}
