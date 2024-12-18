-- @WIP
-- Keymaps to toggle formatting. Use below `lint.lua` remap example as reference.
--vim.api.nvim_set_keymap("n", "<leader>li", ":lua update_lint_level('info')<CR>", { noremap = true, silent = true })

--
require("conform")
vim.api.nvim_set_keymap("n", "<leader>fd", ":FormatDisable <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>FormatEnable<CR>", { noremap = true, silent = true })
