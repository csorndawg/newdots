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

-- source custom colorscheme
require("extra.colorschemes.nord")
--require("extra.bufferline-custom")
--require("extra.lualine-custom")

-- ------------------------------------------------------------
-- Custom native nvim (non-plugin) configuration code
-- ------------------------------------------------------------

require("user.opts")
require("user.keymaps")
require("user.autocmds")
print("Loaded native Nvim custom config modules successfully")

-- ------------------------------------------------------------
-- Custom "extra" (plugin related) configuration modules
-- ------------------------------------------------------------
require("extra.lazy-remaps")
require("extra.todo-comments-custom")
require("extra.oil-extra")
require("extra.toggleterm-extra")

-- Telescope
require("extra.telescope.telescope-config")
require("extra.telescope.mycustom_pickers")
require("extra.ufo")
require("extra.git-keymaps") -- custom keymaps for git-related plugins (fugitive, telescope, etc.)
print("Loaded oneoff config modules successfully")

-- Mason configuration
require("extra.mason")
-- print("\nMason loaded successfully")

-- LSP-related (lsp, conform, etc.) modules
local extra_lsp_dir = vim.fn.stdpath("config") .. "/lua/extra/lsp"
for _, file in ipairs(vim.fn.readdir(extra_lsp_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.lsp." .. file:sub(1, -5)
		local ok, mod = pcall(require, module_name)
		-- if ok then
		-- 	-- vim.notify("Successfully sourced module:  " .. module_name .. ": " .. mod, vim.log.levels.WARN)
		-- 	vim.notify("Successfully sourced module:  " .. module_name, vim.log.levels.WARN)
		-- end
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
print("Loaded LSP modules successfully")

-- CMP-related (nvim-cmp, dadbod, etc.) modules
local extra_cmp_dir = vim.fn.stdpath("config") .. "/lua/extra/cmp"
for _, file in ipairs(vim.fn.readdir(extra_cmp_dir)) do
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
print("Loaded nvim-cmp modules successfully")

-- LuaSnip
local luasnips_snippets_dir = vim.fn.stdpath("config") .. "/lua/extra/cmp/snippets"
for _, file in ipairs(vim.fn.readdir(luasnips_snippets_dir)) do
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
print("Loaded custom LuaSnips snippets successfully")

-- DAP-related modules
local extra_dap_dir = vim.fn.stdpath("config") .. "/lua/extra/dap"
for _, file in ipairs(vim.fn.readdir(extra_dap_dir)) do
	if file:sub(-4) == ".lua" then
		local module_name = "extra.dap." .. file:sub(1, -5)
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
print("Loaded DAP modules successfully")

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
print("Loaded custom Nvim override modules from successfully")

-- source plugin remaps last to ensure they aren't overwritten
require("extra.whichkey-sublabels")
require("extra.whichkey-extra")
require("extra.keymaps-extra")
print("Loaded whichkey modules successfully")
