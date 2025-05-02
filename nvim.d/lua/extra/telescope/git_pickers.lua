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
	vim.keymap.set("n", "<leader>tgc", builtin.git_commits, { desc = "Git Commits", noremap = true })
	vim.keymap.set("n", "<leader>tgC", builtin.git_bcommits, { desc = "Git Buffer Commits", noremap = true })
	vim.keymap.set("n", "<leader>tgb", builtin.git_branches, { desc = "Git Branches", noremap = true })
	vim.keymap.set("n", "<leader>tgs", builtin.git_status, { desc = "Git Status", noremap = true })
	vim.keymap.set("n", "<leader>tgS", builtin.git_stash, { desc = "Git Stash", noremap = true })
end

return M
