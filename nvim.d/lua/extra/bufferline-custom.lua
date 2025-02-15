-- Bufferline Configurations
local M = {}
M.setup = function()
	--require('bufferline').setup
	-- Bufferline
	local highlights = require("nord").bufferline.highlights({
		italic = true,
		bold = true,
	})

	require("bufferline").setup({
		options = {
			separator_style = "thin",
		},
		highlights = highlights,
	})
end
return M
