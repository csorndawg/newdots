-- @TEST: "desc" appears in whichkey map CONFIRMED. still testing keymap keys themselves
vim.keymap.set("n", "]g", ":diffget //2<CR>", { desc = "Diffput Left" })
vim.keymap.set("n", "[g", ":diffput //3<CR>", { desc = "Diffput Right" })
vim.keymap.set("n", "]h", ":diffget //3<CR>", { desc = "Diffget Right" })
vim.keymap.set("n", "[h", ":diffput //2<CR>", { desc = "Diffput Left" })
