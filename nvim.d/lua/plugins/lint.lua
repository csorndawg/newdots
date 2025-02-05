return {

	{ -- Linting
		"mfussenegger/nvim-lint",

		config = function()
			--require("lint").setup() -- setup default?
			require("extra.lint")
		end,
	},
}
