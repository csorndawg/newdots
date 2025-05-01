local default = require("snacks.config").defaults.scratch

return vim.tbl_deep_extend("force", default, {
	border = "rounded",
	filetype = "markdown",
})
