local default = require("snacks.config").defaults.input

return vim.tbl_deep_extend("force", default, {
	border = "rounded",
	relative = "cursor",
})
