-- Defining all built in "git pickers" to setup
-- All git picker keymaps will be nested within the "<Leader>sg" key  (eg. "<L>sgc")

-- Imports
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values

local M = {}

-- Define custom picker logic here

-- Setup keymaps with either builtin or custom picker function
M.setup = function()
	-- Telescope Builtin Git Pickers
	vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits", noremap = true })
	vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git Buffer Commits", noremap = true })
	vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches", noremap = true })
	vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status", noremap = true })
	vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Git Stash", noremap = true })
end

return M
