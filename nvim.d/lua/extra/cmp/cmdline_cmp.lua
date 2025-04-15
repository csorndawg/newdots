-- nvim-cmdline configuration

local cmp = require("cmp")

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		-- These mappings work in Cmdline mode:
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})
