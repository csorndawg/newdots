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
require("extra.cmp-test")
require("extra.mason-lspconfig") -- sensitive to loading order ; might need to be first "required" module ; needs to be before "extra.lsp"

require("user.opts")
require("user.keymaps")
require("user.autocmds")

-- load colorscheme from nvim.d/lua/extra/colorscheme.lua

require("extra.lsp")
require("extra.lazy_remaps")

-- experimental post-install configurations
require("extra.experimental")
require("extra.lint")
require("extra.telescope.telescope-config")
require("extra.which_key")
require("extra.todo-comments-custom")

-- custom helper module for easier plugin module dependency management
local ih = require("runtime.import_helper")
ih.import_custom_luasnips() -- loads all custom luasnip files that match specific regex

require("extra.dap-extras")
require("extra.mini-surround") -- @NOTE: use as reference for extending default plugin configurations
require("extra.git-keymaps") -- custom keymaps for git-related plugins (fugitive, telescope git pickers, etc.)

-- @TESTME
require("extra.lspconfig_extra")
require("extra.mason-tool-extra")
