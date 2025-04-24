-- Keymaps to activate/run one of the Telescope keymap picker

vim.keymap.set("n", "<leader>ki", function()
	require("extra.overrides.active.keymap_picker")("i") -- insert mode
end, { desc = "Telescope Insert Mode Keymaps" })

vim.keymap.set("n", "<leader>kc", function()
	require("extra.overrides.active.keymap_picker")("c") -- command-line mode
end, { desc = "Telescope Command Mode Keymaps" })
