-- Custom keymaps for nvim/nvim plugin git-related tools such as vim-fugitive, git-blame, lazygit, and telescope git pickers.

-- -- @NOTE: Omit //[2/3] tail. Will manually enter for now. Can make new mapping for 2/3 tail if needed.
-- -- diffput
-- vim.keymap.set("n", "<leader>gdp", ":diffput //", { desc = "Diffput", noremap = true })
-- vim.keymap.set("n", "<leader>gdg", ":diffget //", { desc = "Diffget", noremap = true })
--
-- -- diffput
-- vim.keymap.set("n", "<leader>dp", ":diffput", { desc = "Diffput", noremap = true })
-- vim.keymap.set("n", "<leader>p2", ":diffput //2<Cr>", { desc = "Diffput", noremap = true })
-- vim.keymap.set("n", "<leader>p3", ":diffput //3<Cr>", { desc = "Diffput", noremap = true })
--
-- -- diffget
-- vim.keymap.set("n", "<leader>dg", ":diffget //", { desc = "Diffget", noremap = true })
-- vim.keymap.set("n", "<leader>g2", ":diffget //2<Cr>", { desc = "Diffget", noremap = true })
-- vim.keymap.set("n", "<leader>g3", ":diffget //3<Cr>", { desc = "Diffget", noremap = true })
--
-- -- hunk navigation
-- vim.keymap.set("n", "<leader>ghp", "[c", { desc = "Previous hunk", noremap = true })
-- vim.keymap.set("n", "<leader>ghn", "]c", { desc = "Next hunk", noremap = true })
--
-- fugitive essentials
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite <cr>", { desc = "Gwrite", noremap = true })
vim.keymap.set("n", "<leader>gl", "<cmd>Gllog <cr>", { desc = "Git log", noremap = true })

-- add extra key to end of fugitive remaps to avoid namespace conflict with telescope Git pickers
vim.keymap.set("n", "<leader>gcc", "<cmd>Git commit <cr>", { desc = "Git commit", noremap = true })
vim.keymap.set("n", "<leader>gg", "<cmd>G <cr>", { desc = "Git status (fugitive)", noremap = true })
vim.keymap.set("n", "<leader>gds", "<cmd>Gvdiffsplit! <cr>", { desc = "3-way diff split", noremap = true })
vim.keymap.set("n", "<leader>gD", "<cmd>Gvdiffsplit! <cr>", { desc = "3-way diff split", noremap = true })

-- Telescope Git Pickers - Extra keymaps
-- Telescope Builtin Git Pickers
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits", noremap = true })
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git Buffer Commits", noremap = true })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches", noremap = true })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status", noremap = true })
vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Git Stash", noremap = true })
