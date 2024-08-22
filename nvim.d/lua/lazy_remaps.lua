-- simple plugin remap example

--
-- Neotree
--
-- <space>t to toggle neotree window on/off
--return {
vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree toggle<CR> ', { noremap = trhue })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Neotree buffers toggle<CR> ', { noremap = true })
--}
