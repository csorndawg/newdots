-- Defining all built in "vimn pickers" to setup
-- Must be defined in telescope plugin's `config()` function (see `multigrep` for example)

-- Imports
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values

-- Define all builtin keymaps within the "M.setup" function
-- For custom function/telescopes define the custom logic within "local M = {}" and before M.setup()"
-- then just pass the name of the function as an argument (eg. see "multigrep.lua")
local M = {}

M.setup = function()
	-- Cmd mode commands
	vim.keymap.set("n", "<leader>svc", builtin.commands, { desc = "Find Cmd Commands", noremap = true })

	-- Search marks
	vim.keymap.set("n", "<leader>svm", builtin.marks, { desc = "Find Marks", noremap = true })

	-- -- command history
	-- @FIXME: Adjust so theres two outcomes: (1) reruns the command (2) spits out the previous command, in CMD mode panel, but doesnt execute
	vim.keymap.set("n", "<leader>svH", builtin.command_history, { desc = "Command History", noremap = true })
	-- search history
	vim.keymap.set("n", "<leader>svh", builtin.search_history, { desc = "Search History", noremap = true })

	-- quickfix
	vim.keymap.set("n", "<leader>svq", builtin.quickfix, { desc = "Telescope Quickfix list", noremap = true })

	-- jumplist
	vim.keymap.set("n", "<leader>svj", builtin.jumplist, { desc = "Telescope Jumplist", noremap = true })

	-- autocommands
	vim.keymap.set("n", "<leader>sva", builtin.autocommands, { desc = "Search autocommands", noremap = true })

	-- current buffer search
	vim.keymap.set(
		"n",
		"<leader>svB",
		builtin.current_buffer_fuzzy_find,
		{ desc = "Search Current Buffer", noremap = true }
	)

	-- vim options
	vim.keymap.set("n", "<leader>svo", builtin.vim_options, { desc = "Find Vim Options", noremap = true })

	-- @FIXME: need a little more adjusting, currently performs macro AND spits out macro characters
	-- registers
	vim.keymap.set("n", "<leader>svR", builtin.registers, { desc = "Search Registers", noremap = true })

	-- keymaps
	vim.keymap.set("n", "<leader>svk", builtin.keymaps, { desc = "Search Keymaps", noremap = true })

	-- filetypes
	vim.keymap.set("n", "<leader>svz", builtin.filetypes, { desc = "Search Filetypes", noremap = true })

	-- highlights
	vim.keymap.set("n", "<leader>svZ", builtin.highlights, { desc = "Search Highlights", noremap = true })
end
return M
