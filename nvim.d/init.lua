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
-- END OF LAZY BOOTSTRAP
-- -----------------------------------------------------------------

-- -----------------------------------------------------------------
-- SOURCE CORE NVIM CONFIGURATION FILES
-- -----------------------------------------------------------------

--require("user.opts")
--require("user.autocmds")
--require("user.keymaps")


-- -----------------------------------------------------------------
-- START OF PLUGIN CONFIGURATION SOURCING
-- -----------------------------------------------------------------

-- enable Nord theme
vim.cmd("colorscheme nord")

require('lualine').setup({
  options = { theme = 'nord' }
})

local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
})

require("bufferline").setup({
    options = {
        separator_style = "thin",
        theme = 'nord',
    },
    highlights = highlights,
})

-- LEAP.nvim
require("extra.leap")

-- -----------------------------------------------------------------
-- END OF PLUGIN CONFIGURATION SOURCING
-- -----------------------------------------------------------------

