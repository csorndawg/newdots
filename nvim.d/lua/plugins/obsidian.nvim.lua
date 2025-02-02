local obsidian_helper = require("extra.obsidian")

return {
	"epwalsh/obsidian.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy", -- Ensures the plugin loads properly
	opts = obsidian_helper.opts, -- Load custom options from helper module
	config = function(_, opts)
		require("obsidian").setup(opts) -- Ensure settings are applied
		obsidian_helper.setup() -- Set keymaps
	end,
}
