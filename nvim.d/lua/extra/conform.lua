-- @WIP
-- Keymaps to toggle formatting. Use below `lint.lua` remap example as reference.
--vim.api.nvim_set_keymap("n", "<leader>li", ":lua update_lint_level('info')<CR>", { noremap = true, silent = true })

--
require("conform")
vim.keymap.set("n", "<leader>fd", ":FormatDisable <CR>", { desc = "Disable formatting", noremap = true })
vim.keymap.set("n", "<leader>fe", "<cmd>FormatEnable<CR>", { desc = "Enable formatting", noremap = true })

-- on-demand formatting
vim.keymap.set({ "n", "v" }, "<leader>ff", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format code" })
