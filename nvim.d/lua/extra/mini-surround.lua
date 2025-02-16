local ms = require("mini.surround")
vim.print(ms)

ms.setup({

	highlight_duration = 750,
	mappings = {
		add = "msa", -- test
		highlight = "msh",
	},
	search_method = "cover_or_next", -- default: cover
})

vim.print(ms)
