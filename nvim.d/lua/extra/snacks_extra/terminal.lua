local default = require("snacks.config").defaults.terminal

return vim.tbl_deep_extend("force", default, {
	float = {
		border = "rounded",
		title_pos = "center",
	},
	size = {
		width = 0.9,
		height = 0.8,
	},
})
