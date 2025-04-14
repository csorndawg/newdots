-- File ONLY contains installation code
-- All extension configuration logic is defined in "extra/telescope/extensions/"

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-z.nvim",
			"doctorfree/cheatsheet.nvim",
			"FeiyouG/commander.nvim",
			"camgraff/telescope-tmux.nvim",
			"benfowler/telescope-luasnip.nvim",
		},
	},
}
