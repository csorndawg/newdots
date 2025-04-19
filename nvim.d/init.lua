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

--require("extra.mini-surround") -- use as reference for extending default plugin configurations

-- sourcing start
require("extra.lazy_remaps")
require("extra.todo-comments-custom")

-- experimental post-install configurations
require("extra.experimental")
require("extra.lint")
require("extra.telescope.telescope-config")
require("extra.which_key")

-- Luasnips: Custom and community snippets
-- custom helper module for easier plugin module dependency management

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
local override_path = vim.fn.stdpath("config") .. "/lua/extra/overrides/active"

for _, file in ipairs(vim.fn.readdir(override_path)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.overrides.active." .. file:sub(1, -5)
		local ok, mod = pcall(require, module_name)
		if ok and type(mod) == "table" and mod.setup then
			pcall(mod.setup) -- call setup() if defined
		end
	end
end

-- @IMPORTANT: Expanding framework from above (with "extra/override" framework) to cover ALL NVIM configuration logic. This works by adding specific config types as subdirs to "overrides/active" and just source all files "active" filetree.

-- new (directory location for nvim overrides/runtime config for ALL nvim configuration facets not just plugins)
-- nvim.d/lua/overrides/active **main dir  (all subdir .lua files) should be sourced
-- example: nvim.d/lua/overrides/active/utils/ui_test.lua
-- ex2: nvim.d/lua/overrides/active/opts_ex.lua

-- @TEST: Lua script that sources all .lua files in overrides/active dir or subdir at runtime
local override_dir = vim.fn.stdpath("config") .. "/lua/overrides/active"
local base_module = "overrides.active"

local function rstrip_ext(filename)
	return filename:gsub("%.lua$", "")
end

local function path_to_module(path)
	-- Convert file path to Lua require path
	local rel_path = path:sub(#override_dir + 2) -- +2 to remove "/" as well
	return base_module .. "." .. rstrip_ext(rel_path):gsub("/", ".")
end

local function recursive_require(path)
	local uv = vim.loop
	local handle = uv.fs_scandir(path)
	if not handle then
		return
	end

	while true do
		local name, typ = uv.fs_scandir_next(handle)
		if not name then
			break
		end

		local full_path = path .. "/" .. name

		if typ == "file" and name:match("%.lua$") then
			local ok, err = pcall(require, path_to_module(full_path))
			if not ok then
				vim.notify("Failed to load override: " .. full_path .. "\n" .. err, vim.log.levels.ERROR)
		-- @TEST: my tweak
		else
				vim.notify("Loaded override: " .. full_path .. "\n")
		
			end
		elseif typ == "directory" then
			recursive_require(full_path)
		end
	end
end

recursive_require(override_dir)
