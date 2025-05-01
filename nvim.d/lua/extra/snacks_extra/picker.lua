local default = require("snacks.config").defaults.picker

return vim.tbl_deep_extend("force", default, {
	backend = "telescope",
	theme = "ivy",
})
