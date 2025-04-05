-- Telescope multigrep search, within all open buffers, that allows for multiple selections.
-- Where each selection gets opened in a buffer.

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local builtin = require("telescope.builtin")

local M = {}

local multigrep_extended = function()
	builtin.live_grep({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local selections = picker:get_multi_selection()
				if vim.tbl_isempty(selections) then
					table.insert(selections, action_state.get_selected_entry())
				end
				actions.close(prompt_bufnr)

				for _, entry in ipairs(selections) do
					local filename = entry.filename or entry.path
					local lnum = entry.lnum or entry.lnum or 1
					local col = entry.col or 1
					vim.cmd(string.format("edit +%d %s", lnum, filename))
				end
			end)
			return true
		end,
	})
end

M.setup = function()
	vim.keymap.set("n", "<leader>tx", multigrep_extended, { desc = "[T]elescope e[X]tended multigrep" })
end

return M
