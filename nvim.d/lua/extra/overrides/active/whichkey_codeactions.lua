-- Keymaps for whichkey <leader>c "[C]ode Action" keymaps
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ct", builtin.treesitter, { desc = "Treesitter objects", noremap = true })
