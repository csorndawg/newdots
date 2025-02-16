local ms = require("mini.surround")
vim.print(ms)

local M = {}

-- require('mini.surround').setup({}) -- replace {} with your config table
M.setup = function()
	highlight = 750
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "SA", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	}
	search_method = "cover_or_next" -- default: cover
end
vim.print(M)
return M
