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

-- EXPERIMENTAL/DEV configs (comment out below if breaking changes occur)
require("extra.cmp-test")
require("extra.mason-lspconfig") -- sensitive to loading order ; might need to be first "required" module ; needs to be before "extra.lsp"

require("user.opts")
require("user.keymaps")
require("user.autocmds")

-- @TEST
require("runtime.ft_autocmds")

-- load colorscheme from nvim.d/lua/extra/colorscheme.lua
require("extra.colorscheme")
require("extra.lsp")
require("extra.lazy_remaps")

-- experimental post-install configurations
require("extra.experimental")
require("extra.lint")
require("extra.telescope.telescope-config")
require("extra.which_key")

-- custom luasnips snippets
require("extra.luaSnipsCustom.bash_custom")
require("extra.luaSnipsCustom.python_custom")
--require("extra.luaSnipsCustom.lua_custom")
--require("extra.luaSnipsCustom.vim_custom")
require("extra.luaSnipsCustom.all_custom")
require("extra.todo-comments-custom")

-- @RC TESTS
require("extra.conform-custom")
