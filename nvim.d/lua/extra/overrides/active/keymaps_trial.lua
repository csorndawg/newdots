-- Safe place for experimenting/testing new remaps before moving them permanent location

local map = vim.keymap.set
local opts = { noremap = true, silent = true }


-- swap 'redo' and 'replace mode' keymaps with each other
vim.keymap.set("n", "r", "<C-r>", { noremap = true }) -- @passed
vim.keymap.set("n", "<C-r>", "R", { noremap = false })

