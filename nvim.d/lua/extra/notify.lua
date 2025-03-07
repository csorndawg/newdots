local M = {}

M.setup = function()
	local notify = require("notify")

	-- nord-themed background color for notify
	notify.setup({
		background_colour = "#3B4252",
	})

	vim.notify = notify
end

return M
