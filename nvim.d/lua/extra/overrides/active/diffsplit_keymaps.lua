-- @TEST: "desc" appears in whichkey map CONFIRMED. still testing keymap keys themselves
--
-- Left bracket '['  represents LEFT (//2) buffer
-- Right bracket ']' represents RIGHT (//3) buffer
-- 'g' represents 'get'
-- 'h' represents 'put' (no easily accessible. mnemonic key available)

-- Left //2 Buffer
vim.keymap.set("n", "[g", ":diffget //2<CR>", { desc = "Diffget Left", noremap = true })
vim.keymap.set("n", "[h", ":diffput //2<CR>", { desc = "Diffput Left", noremap = true })

-- Right //3 Buffer
vim.keymap.set("n", "]g", ":diffget //3<CR>", { desc = "Diffget Right", noremap = true })
vim.keymap.set("n", "]h", ":diffput //3<CR>", { desc = "Diffput Right", noremap = true })
