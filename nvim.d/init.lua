--- ---------------------------------------------------
---   bootstrap lazy.nvim
-- ---------------------------------------------------

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

-- @NOTE
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

-- ---------------------------------------------------
--  source custom nvim config submodules
-- ---------------------------------------------------

-- editor configurations
require("extra.colorschemes.nord")
--require("extra.bufferline-custom")
--require("extra.lualine-custom")

-- EXPERIMENTAL/DEV configs (comment out below if breaking changes occur)

-- Custom settings
require("user.opts")
require("user.keymaps")
require("user.autocmds")

-- @IMPORTANT: Has downstream dependencies
require("extra.mason-lspconfig") -- all LSP configurations depend on this being loaded before they are ran

-- WIP:Custom plugin/extra configurations
-- put <require('extra.<module>')> code here after confirming module is
-- correctly installed, sourced, and configured.
require("extra.todo-comments-custom")

-- @WARN: All modules below are either 'experimental' or "hotfix" and will require refactoring
-- 	  after enabling all features/functionality for my "essential" NVIM.
--require("extra.lsp")
require("extra.lazy_remaps")

-- experimental post-install configurations
require("extra.experimental")
require("extra.lint")
require("extra.telescope.telescope-config")
require("extra.which_key")

-- custom helper module for easier plugin module dependency management
local ih = require("runtime.import_helper")
ih.import_custom_luasnips() -- loads all custom luasnip files that match specific regex

require("extra.dap-extras")
--require("extra.mini-surround") -- @NOTE: use as reference for extending default plugin configurations

-- @PASSED: All 2/25+ custom modules that PASSED INTEGRATION testing and can be permanetly added to init.lua

require("extra.git-keymaps") -- custom keymaps for git-related plugins (fugitive, telescope git pickers, etc.)

-- @TESTING: All 2/25+ MVP Nvim custom modules creating, sourcing, testing, and integrating

--require("extra.lsp-extra")
require("extra.cmp-test")
require("extra.lsp")
require("extra.conform")
require("extra.telescope.mycustom_pickers")
require("extra.oil_extra")
require("extra.toggleterm_x")
