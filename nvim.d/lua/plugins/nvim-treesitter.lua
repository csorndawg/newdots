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
					"c",
					"comment",
					"csv",
					-- "dap_repl", -- note: plugin must be installed/setup or this will break
					"diff",
					"dockerfile",
					"editorconfig",
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"html",
					"http",
					"ini",
					"jinja",
					"jinja_inline",
					"jq",
					"json",
					"just",
					"lua",
					"luadoc",
					"make",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"sql",
					"ssh_config",
					"terraform",
					"tmux",
					"todotxt",
					"toml",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
					"tsv",
				},
				-- sync_install = false,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
