-- create (M)odule table with custom configurations that will be
-- called by Lazy during plugin's setup
local M = {}

-- create an "opts" key in our "M" table
-- set the value for the "opts" key value to another Lua table with my custom options
-- if the option is configured by default, it will be overwritten by the below table
M.opts({
	workspaces = {
		name = "notes",
		path = "~/git/obsiddy",
	},
	notes_subdir = "_Notes",
	daily_notes = {
		folder = "DAILY-NOTES",
		date_format = "%Y-%m-%d",
		default_tags = { "test-tag", "daily-notes" },
		-- optional, if you want to directly insert a template from your template directory like 'daily.md'
		--template = nil,
	},
	new_notes_location = "notes_subdir",
	--completion = {
	-- nvim_cmp = true, -- integrate nvim-cmp completion
	-- },
})

-- define custom keymaps for Obsidian plugin
function M.setup()
	vim.keymap.set(
		"n",
		"<leader>on",
		"<cmd>ObsidianNew<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian New" }
	)
	vim.keymap.set(
		"n",
		"<leader>os",
		"<cmd>ObsidianSearch<CR>",
		{ noremap = true, silent = true, desc = "[O]bsidian [S]earch note" }
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
		{ noremap = true, silent = true, desc = "[O]bsidian [T]ag search" }
	)
end

return M -- allow above configurations to be imported by other lua files
