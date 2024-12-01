-- POST-CMP LSP REMAPS

-- use <Ctrl-Tab> to ignore cmp popup menu selections, and continue tabbing
--vim.api.nvim_set_keymap("i", "..", "<C-c>a", { silent = true, noremap = true })
vim.api.nvim_set_keymap("i", "<C-Tab>", "<C-c>a<Tab>", { silent = true, noremap = true })
--vim.api.nvim_set_keymap("i", "<leader>.", "<C-n><C-e>", { silent = true, noremap = true })
