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

-- @IMPORTANT: EXTRA PLUGIN CONFIGURATION FILES DEFINED BELOW
local ih = require("runtime.import_helper")
--require("extra.mini-surround") -- use as reference for extending default plugin configurations

-- sourcing start
require("extra.lazy_remaps")
require("extra.todo-comments-custom")

-- experimental post-install configurations
require("extra.experimental")
require("extra.lint")
require("extra.telescope.telescope-config")
require("extra.which_key")

-- @IMPORTANT: All 2/25+ custom modules that PASSED INTEGRATION testing and can be permanetly added to init.lua
-- BELOW PLUGINS PASSED TESTING/CHECKS
require("extra.oil_extra")
require("extra.toggleterm_x")
require("extra.git-keymaps") -- custom keymaps for git-related plugins (fugitive, telescope, etc.)

require("extra.lsp")
require("extra.conform")
require("extra.toggleterm_x")

-- @WIP: Below modules are still in the process of being defined/tested/integrated as of 3/3+
--require("extra.lsp-extra")
require("extra.telescope.mycustom_pickers")
require("extra.ufo")

-- @TESTING: Dap configs
require("extra.dap")

-- @IMPORTANT: Below is still being tested. But if successfully it will allow for all config changes to be tested as overrides first, then moved to perm spot before merging with MAIN
-- Load only active overrides from lua/extra/overrides/active/

-- Sources all lua files in "overrides/active" like above commented out code
-- except this also returns info about any failed loads for debugging.
local override_path = vim.fn.stdpath("config") .. "/lua/extra/overrides/active"
for _, file in ipairs(vim.fn.readdir(override_path)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.overrides.active." .. file:sub(1, -5)
		local ok, mod = pcall(require, module_name)
		if not ok then
			vim.notify("Failed to load " .. module_name .. ": " .. mod, vim.log.levels.ERROR)
		elseif type(mod) == "table" and mod.setup then
			local setup_ok, err = pcall(mod.setup)
			if not setup_ok then
				vim.notify("Error running setup() in " .. module_name .. ": " .. err, vim.log.levels.ERROR)
			end
		end
	end
end

-- @WIP: Source LuaSnips Experimental snippets directory for testing/developing. Comment out if issues occurr, and test manually.
local experimental_luasnips_dir = vim.fn.stdpath("config") .. "/lua/extra/overrides/active/ExperimentalLoosnips"
for _, file in ipairs(vim.fn.readdir(experimental_luasnips_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.overrides.active.ExperimentalLoosnips." .. file:sub(1, -5)
		local ok, mod = pcall(require, module_name)
		if not ok then
			vim.notify("Failed to load " .. module_name .. ": " .. mod, vim.log.levels.ERROR)
		elseif type(mod) == "table" and mod.setup then
			local setup_ok, err = pcall(mod.setup)
			if not setup_ok then
				vim.notify("Error running setup() in " .. module_name .. ": " .. err, vim.log.levels.ERROR)
			end
		end
	end
end
