return {
	-- { "nvim-treesitter/nvim-treesitter", }

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"awk",
					"bash",
					"csv",
					"diff",
					"dockerfile",
					"git_config",
					"gitcommit",
					"gitignore",
					"groovy",
					"html",
					"ini",
					"jq",
					"json",
					"lua",
					"luadoc",
					"make",
					"markdown",
					"printf",
					"promql",
					"python",
					"regex",
					"requirements",
					"sql",
					"ssh_config",
					"terraform",
					"tmux",
					"toml",
					"tsv",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
