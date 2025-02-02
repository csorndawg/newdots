local M = {}

M.opts = {
	workspaces = {
		{
			name = "notes",
			path = "~/git/obsiddy",
		},
	},
	completion = {
		nvim_cmp = true, -- Enable nvim-cmp support
	},
	notes_subdir = "_Note",
	daily_notes = {
		folder = "DAILY-NOTES",
		date_format = "%Y-%m-%d",
		default_tags = { "test-tag", "daily-notes" },
		--template = nil,
	},
	new_notes_location = "notes_subdir",
}

-- Function to set up keymaps after plugin loads
function M.setup()
	if not require("lazy.core.config").plugins["obsidian.nvim"]._.loaded then
		return
	end
	vim.keymap.set(
		"n",
		"<leader>on",
		"<cmd>ObsidianNew<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian new note" }
	)
	vim.keymap.set(
		"n",
		"<leader>os",
		"<cmd>ObsidianSearch<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian [S]earch" }
	)
	vim.keymap.set(
		"n",
		"<leader>or",
		"<cmd>ObsidianRename<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian Rename" }
	)
	vim.keymap.set(
		"n",
		"<leader>ot",
		"<cmd>ObsidianTags<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian tag search" }
	)
end

return M
