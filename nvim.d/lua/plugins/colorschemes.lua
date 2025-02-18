return {
	{
		"neanias/everforest-nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd.colorscheme("kanagawa")
			vim.api.nvim_set_hl(0, "TermCursor", { fg = "#A6E3A1", bg = "#A6E3A1" })
		end,
	},
}
