return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				-- overrides default 'cmdline_popup' view since it breaks nvim-cmp ':' completion
				view = "cmdline",
			},
			-- more custom noice options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
