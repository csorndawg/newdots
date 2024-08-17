-- neovim  core remaps

-- paste on
vim.api.nvim_set_keymap('n', '<leader>pp', ':set paste<CR>', { noremap = true })

-- paste off
vim.api.nvim_set_keymap('n', '<leader>npp', ':set nopaste<CR>', { noremap = true, silent = true })

