-- Custom keymaps for default (standard) Telescope functionality

-- NOTE: still working on migrating existing Telescope whichkey mappings from "s" to "t" subkey
--        so in the interim im adding to both "s" and "t" subkeys
vim.keymap.set("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", { desc = "Telescope Keymaps" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "🔑 Show Keymaps" })
