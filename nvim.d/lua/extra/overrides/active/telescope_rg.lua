-- set keymaps/config for telescope-rg extension

-- FILE SEARCHER
vim.keymap.set("n", "<leader>TR", function()
	require("telescope").extensions.ripgrep.ripgrep_files({})
end, { desc = "Rg Files", noremap = true })

-- TEXT SEARCHER
vim.keymap.set("n", "<leader>Tr", function()
	require("telescope").extensions.ripgrep.ripgrep_text({})
end, { desc = "Rg text", noremap = true })

-- TEXT SEARCHER IN DIR OF CURRENTLY OPEN FILE
-- vim.keymap.set("n", "<leader>sa", function()
--     require("telescope").extensions.ripgrep.ripgrep_text({
--         curr_file_dir = true,
--     })
-- end, {})
