-- Smart "require" plugin that allows for tab-cmp with all my installed, but not laoded, plugins

-- File: lua/extra/overrides/plugg_hot_reload.lua

local M = {}

-- Utility to convert path to Lua require module
local function path_to_module(filepath, base)
	local mod = filepath:gsub("%.lua$", ""):gsub("^" .. vim.pesc(base) .. "/", ""):gsub("/", ".")
	return mod
end

-- Telescope picker for Lua modules in your config's lua/ directory
function M.pick_lua_module()
	local telescope = require("telescope.builtin")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local lua_path = vim.fn.stdpath("config") .. "/lua"

	telescope.find_files({
		prompt_title = "Hot Reload Lua Plugin",
		cwd = lua_path,
		find_command = { "fd", "--extension", "lua" },
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				local rel_path = entry.path or entry.value
				local mod = path_to_module(rel_path, lua_path)
				actions.close(prompt_bufnr)
				vim.schedule(function()
					vim.api.nvim_feedkeys(':lua= require("' .. mod .. '")', "n", false)
				end)
			end)
			return true
		end,
	})
end

-- Sets up keymaps
function M.setup()
	-- Opens command-line with `:lua= require("` prefilled
	vim.keymap.set("n", "<leader>rp", ':lua= require("', { noremap = true, desc = "Require plugin (manual input)" })

	-- Opens fuzzy picker of available Lua modules
	vim.keymap.set("n", "<leader>rP", M.pick_lua_module, { noremap = true, desc = "Fuzzy require plugin (Telescope)" })
end

return M
