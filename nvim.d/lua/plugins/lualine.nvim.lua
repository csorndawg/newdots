return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord", -- Default theme
			},
		})
		-- Load custom config (this will override the above defaults)
		require("extra.lualine-custom").setup()
	end,
}
