-- Adhoc/Oneoff plugin remaps

-- Mason/Mason Tool
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason UI", noremap = true, silent = false })
vim.keymap.set(
	"n",
	"<leader>cM",
	"<cmd>MasonToolsUpdate <cr>",
	{ desc = "Update Mason Tools", noremap = true, silent = false }
)

-- buffer navigation
-- vim.keymap.set("n", "<S-.>", "<cmd>bn<Cr>", { silent = false, desc = "Buffer next", noremap = true })
-- vim.keymap.set("n", "<S-,>", "<cmd>bp<Cr>", { silent = false, desc = "Buffer prev", noremap = true })
vim.keymap.set("n", "<Leader>bl", "<cmd>buffers<Cr>", { desc = "List buffers", noremap = true })
vim.keymap.set("n", "<Leader>bb", "<cmd>blast <Cr>", { silent = false, desc = "Last buffer", noremap = true })
vim.keymap.set("n", "<Leader>bd", "<cmd>bd <Cr>", { silent = false, desc = "Delete buffer", noremap = true })
vim.keymap.set("n", "<Leader>bD", "<cmd>bd! <Cr>", { silent = true, desc = "Force Delete buffer", noremap = true })

vim.keymap.set("n", "<C-Right>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":bprevious<CR>", { noremap = true, silent = true })
