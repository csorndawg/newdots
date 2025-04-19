return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			--  notify= { enabled = true },
			--  rename = { enabled = true },
			--  toggle** = { enabled = true },
			-- bufdelete = { enabled = true },

			-- git = { enabled = true },
			-- layouy = { enabled = true },
			-- lazygit = { enabled = true },
			bigfile = { enabled = true },
			input = { enabled = true },
			explorer = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			scratch = { enabled = true },
			util = { enabled = true },
			win = { enabled = true },
		},
	},
}
