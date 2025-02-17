-- Custom keymaps for nvim/nvim plugin git-related tools such as vim-fugitive, git-blame, lazygit, and telescope git pickers.

-- @NOTE: Omit //[2/3] tail. Will manually enter for now. Can make new mapping for 2/3 tail if needed.
-- diffput
vim.keymap.set("n", "<leader>gdp", ":diffput //", { desc = "Diffput", noremap = true })
vim.keymap.set("n", "<leader>gdg", ":diffget //", { desc = "Diffget", noremap = true })

-- hunk navigation
vim.keymap.set("n", "<leader>ghp", "[c", { desc = "Previous hunk", noremap = true })
vim.keymap.set("n", "<leader>ghn", "]c", { desc = "Next hunk", noremap = true })

-- fugitive essentials
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite <cr>", { desc = "Gwrite", noremap = true })
vim.keymap.set("n", "<leader>gl", "<cmd>Gllog <cr>", { desc = "Git log", noremap = true })

-- commit changes ("cc" also creates commit with fugitive)
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit <cr>", { desc = "Git commit", noremap = true })

-- <x>
vim.keymap.set("n", "<leader>gds", "<cmd>Gvdiffsplit! <cr>", { desc = "3-way diff split", noremap = true })
vim.keymap.set("n", "<leader>gs", "<cmd>G <cr>", { desc = "Git status (fugitive)", noremap = true })
