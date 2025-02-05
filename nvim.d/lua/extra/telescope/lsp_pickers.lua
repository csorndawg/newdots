-- Defining all built in "lsp pickers" to setup

-- Imports
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values

local M = {}

-- Define custom picker logic here

-- Setup keymaps with either builtin or custom picker function
M.setup = function()
	-- Telescope Builtin Git Pickers
	vim.keymap.set("n", "<leader>slr", builtin.lsp_references, { desc = "References", noremap = true })
	vim.keymap.set("n", "<leader>sli", builtin.lsp_incoming_calls, { desc = "Incoming", noremap = true })
	vim.keymap.set("n", "<leader>slo", builtin.lsp_outgoing_calls, { desc = "Outgoing", noremap = true })
	vim.keymap.set("n", "<leader>sls", builtin.lsp_document_symbols, { desc = "Document Symbols", noremap = true })
	vim.keymap.set("n", "<leader>slS", builtin.lsp_workspace_symbols, { desc = "Workplace Symbols", noremap = true })
	vim.keymap.set("n", "<leader>sld", builtin.diagnostics, { desc = "Diagnostics", noremap = true })
	-- @FIXME: Need to review both definitions pickers - unable to tell if broken or I am not using/testing correctly
	vim.keymap.set("n", "<leader>slI", builtin.lsp_implementations, { desc = "Implementations", noremap = true })
	vim.keymap.set("n", "<leader>slD", builtin.lsp_definitions, { desc = "Definitions", noremap = true })
	vim.keymap.set("n", "<leader>slT", builtin.lsp_type_definitions, { desc = "Type Definitions", noremap = true })
end

return M
