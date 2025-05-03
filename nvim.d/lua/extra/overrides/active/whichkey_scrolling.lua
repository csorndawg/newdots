vim.api.nvim_create_autocmd("FileType", {
	pattern = "WhichKey",
	callback = function()
		local opts = { buffer = true, noremap = true, silent = true }

		-- Scroll down with <Tab>
		vim.keymap.set({ "n", "i" }, "<Tab>", "<C-d>", opts)

		-- Scroll up with <S-Tab>
		vim.keymap.set({ "n", "i" }, "<S-Tab>", "<C-u>", opts)
	end,
})
