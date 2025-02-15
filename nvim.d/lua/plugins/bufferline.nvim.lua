return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup()

		-- Now safely apply custom highlights after setup
		local ok, custom = pcall(require, "extra.bufferline-custom")
		if ok and custom.highlights then
			bufferline.setup({ highlights = custom.highlights })
		else
			vim.notify("Failed to load custom bufferline theme", vim.log.levels.ERROR)
		end
	end,
}
