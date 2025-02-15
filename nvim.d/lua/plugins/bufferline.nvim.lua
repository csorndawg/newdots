return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		-- Load bufferline with default settings
		require("bufferline").setup()

		-- Load custom config (overwrites default settings)
		require("extra.bufferline-custom").setup()
	end,
}
