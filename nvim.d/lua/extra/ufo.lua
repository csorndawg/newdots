-- UFO config

local ufo = require("ufo")

-- local M = {}
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set("n", "zR", "<cmd> require('ufo').openAllFolds() <cr>", { desc = "UFO Fold Open" })
-- vim.keymap.set("n", "zM", "<cmd> require('ufo').closeAllFolds() <cr>", { desc = "UFO Fold Close" })
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO Fold Open" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO Fold Close" })

-- use treesitter as main provided for UFO folding source
ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

-- return M
