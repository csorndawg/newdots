-- Custom configuration/key bindings for Lazy-installed plugins

-- neo-tree
vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree toggle<CR> ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Neotree buffers toggle<CR> ', { noremap = true })
