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
	vim.keymap.set("n", "<leader>tvc", builtin.commands, { desc = "Search Cmdline Commands", noremap = true })
	vim.keymap.set("n", "<leader>tc", builtin.commands, { desc = "Search Cmdline Commands", noremap = true })
	vim.keymap.set("n", "<leader>?c", builtin.commands, { desc = "Telescope Cmdline commands", noremap = true })
	-- Search marks
	vim.keymap.set("n", "<leader>tvm", builtin.marks, { desc = "Find Marks", noremap = true })
	-- -- command history
	-- @FIXME: Adjust so theres two outcomes: (1) reruns the command (2) spits out the previous command, in CMD mode panel, but doesnt execute
	vim.keymap.set("n", "<leader>tvh", builtin.command_history, { desc = "Command History", noremap = true })
	vim.keymap.set(
		"n",
		"<leader>tC",
		builtin.command_history,
		{ desc = "Search Cmdline Command History", noremap = true }
	)
	-- search history
	vim.keymap.set("n", "<leader>tvs", builtin.search_history, { desc = "Search (Mode) History", noremap = true })
	vim.keymap.set("n", "<leader>ts", builtin.search_history, { desc = "Search mode history", noremap = true })
	vim.keymap.set(
		"n",
		"<leader>?s",
		builtin.search_history,
		{ desc = "Telescope search-mode history", noremap = true }
	)
	-- quickfix
	vim.keymap.set("n", "<leader>tvq", builtin.quickfix, { desc = "Telescope Quickfix list", noremap = true })
	vim.keymap.set("n", "<leader>tq", builtin.quickfix, { desc = "Telescope Quickfix list", noremap = true })
	vim.keymap.set("n", "<leader>?q", builtin.quickfix, { desc = "Telescope quickfix", noremap = true })
	-- jumplist
	vim.keymap.set("n", "<leader>tvj", builtin.jumplist, { desc = "Telescope Jumplist", noremap = true })
	-- autocommands
	vim.keymap.set("n", "<leader>tva", builtin.autocommands, { desc = "Search Autocommands (Events)", noremap = true })
	-- current buffer search
	vim.keymap.set(
		"n",
		"<leader>tb",
		builtin.current_buffer_fuzzy_find,
		{ desc = "Search Current Buffer", noremap = true }
	)
	-- vim options
	vim.keymap.set("n", "<leader>tvo", builtin.vim_options, { desc = "Find Vim Options", noremap = true })
	vim.keymap.set("n", "<leader>?o", builtin.vim_options, { desc = "Vim Options Search", noremap = true })
	-- @FIXME: need a little more adjusting, currently performs macro AND spits out macro characters
	-- registers
	vim.keymap.set("n", "<leader>tvr", builtin.registers, { desc = "Search Registers", noremap = true })
	-- keymaps (has 3 mappings for same action)
	vim.keymap.set("n", "<leader>tvk", builtin.keymaps, { desc = "Search Keymaps", noremap = true })
	vim.keymap.set("n", "<leader>tk", builtin.keymaps, { desc = "Search Keymaps", noremap = true })
	vim.keymap.set("n", "<leader>?k", builtin.keymaps, { desc = "Telescope keymaps", noremap = true })
	-- filetypes
	vim.keymap.set("n", "<leader>tvf", builtin.filetypes, { desc = "Search Filetypes", noremap = true })
	-- highlights
	vim.keymap.set("n", "<leader>tvz", builtin.highlights, { desc = "Search Highlights", noremap = true })
end
return M
