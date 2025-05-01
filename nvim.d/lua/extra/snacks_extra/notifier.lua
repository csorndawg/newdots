local default = require("snacks.config").defaults.notifier

return vim.tbl_deep_extend("force", default, {
	render = "compact",
	stages = "slide",
})
