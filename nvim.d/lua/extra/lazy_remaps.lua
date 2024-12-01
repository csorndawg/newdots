-- Plugin Remaps

-- Lua Locals
local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true, silent = false }
local term_opts = { silent = true }
local remapp = vim.api.nvim_set_keymap -- shorten NVIM remap function call

-- Fugitive
remapp = { "n", "<leader>gs", ":Git <cr>", noremap = true }
remapp = { "n", "<leader>gd", ":Gvdiffsplit! <cr>", noremap = true }
--remapp = { "n", "<leader>ga", ":Git add %<Tab><cr>", noremap = true }
remapp = { "n", "<leader>ga", ":Git add ", noremap = true }
