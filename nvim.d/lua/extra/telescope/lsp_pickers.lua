-- Defining all built in "lsp pickers" to setup

-- Imports
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values

local M = {}

-- Define custom picker logic here

-- Setup keymaps with either builtin or custom picker function
M.setup = function()
	-- Telescope Builtin Git Pickers
	vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "References", noremap = true })
	vim.keymap.set("n", "<leader>li", builtin.lsp_incoming_calls, { desc = "Incoming", noremap = true })
	vim.keymap.set("n", "<leader>lo", builtin.lsp_outgoing_calls, { desc = "Outgoing", noremap = true })
	vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document Symbols", noremap = true })
	vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Workplace Symbols", noremap = true })
	vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Diagnostics", noremap = true })
	vim.keymap.set("n", "<leader>lI", builtin.lsp_implementations, { desc = "Implementations", noremap = true })
	vim.keymap.set("n", "<leader>lD", builtin.lsp_definitions, { desc = "Definitions", noremap = true })
	vim.keymap.set("n", "<leader>lT", builtin.lsp_type_definitions, { desc = "Type Definitions", noremap = true })
end

return M
