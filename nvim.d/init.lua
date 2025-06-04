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
--require("extra.mason-lspconfig") -- all LSP configurations depend on this being loaded before they are ran

-- sourcing start
require("extra.lazy_remaps")
require("extra.todo-comments-custom")

require("extra.telescope.telescope-config")
require("extra.which_key")

-- @IMPORTANT: All 2/25+ custom modules that PASSED INTEGRATION testing and can be permanetly added to init.lua
-- BELOW PLUGINS PASSED TESTING/CHECKS
require("extra.oil_extra")
require("extra.toggleterm_x")
require("extra.git-keymaps") -- custom keymaps for git-related plugins (fugitive, telescope, etc.)
require("extra.toggleterm_x")

-- @WIP: Below modules are still in the process of being defined/tested/integrated as of 3/3+
require("extra.telescope.mycustom_pickers")
require("extra.ufo")

------------------------------------------------

-- @TESTING: Dap configs
-- require("extra.dap")

------------------------------------------------

-- Source Mason configuration from extra/mason
-- @NOTE: Fairly certain this must be sourced before LSP/CMP/DAP modules b/c of dependencies
require("extra.mason.mason")
print("\nMason loaded successfully")

-- @VALIDATED: Confirmed extra/lsp files are being sourced without issue. Tested LSP-CMP integration with pd.Dataframe cmp, which
--              worked (however expansion doesn't trigger till after most of text is typed out. I should look
--              to fix/improve this in future)
--
-- Source custom lsp-related (lsp, conform, etc.) modules
local experimental_luasnips_dir = vim.fn.stdpath("config") .. "/lua/extra/lsp"
for _, file in ipairs(vim.fn.readdir(experimental_luasnips_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.lsp." .. file:sub(1, -5)
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
print("\nExtra/Lsp loaded successfully")

-- @CONFIRMED: I've tested/verified that "extra/cmp" modules are being sourced correctly for the ROOT LEVEL snippets. TOML snippets still not loading.
-- Source custom CMP/LUASNIPS modules
local experimental_luasnips_dir = vim.fn.stdpath("config") .. "/lua/extra/cmp"
for _, file in ipairs(vim.fn.readdir(experimental_luasnips_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.cmp." .. file:sub(1, -5)
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
print("\nExtra/Cmp loaded successfully")

-- @TESTME: TEST if below allows for non-root cmp snippet files to be sourced (eg. "snippets/toml.lua")
-- Source custom LUASNIPS SNIPPETS
local experimental_luasnips_dir = vim.fn.stdpath("config") .. "/lua/extra/cmp/snippets"
for _, file in ipairs(vim.fn.readdir(experimental_luasnips_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.cmp.snippets." .. file:sub(1, -5)
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
print("\nExtra/Cmp/Snippets/ (LuaSnips Custom Snippets) loaded successfully")

-- Always source below last, since they are adhoc patch/override configuraiton code/files
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
print("\nNvim override modules from 'extra/overrides/active/' were loaded successfully")
