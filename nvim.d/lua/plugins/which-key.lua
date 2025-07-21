return {
	{
		"folke/which-key.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			popup_mappings = {
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
		},
		keys = {
			{
				"<leader>??",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Show Which Map",
			},
		},
	},
}
