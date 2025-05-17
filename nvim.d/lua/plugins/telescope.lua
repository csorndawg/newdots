return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {},

					-- liveGrepArgs extras
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
								["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
									postfix = " --iglob ",
								}),
								-- freeze the current list and start a fuzzy search in the frozen list
								["<C-space>"] = require("telescope-live-grep-args.actions").to_fuzzy_refine,
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
				},
			})

			require("telescope").load_extension("fzf")

			vim.keymap.set(
				"n",
				"<Leader>th",
				require("telescope.builtin").help_tags,
				{ desc = "Help tags", noremap = true }
			) -- cmd remapped to <Leader>sh in telescope-config
			vim.keymap.set(
				"n",
				"<Leader>tf",
				require("telescope.builtin").find_files,
				{ desc = "Files search (cwd)", noremap = true }
			)
			vim.keymap.set("n", "<Leader>tn", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "Nvim files search" })
			-- [s]earch [l]azy  -- @NOTE: This was copied from TJ and might not be needed for my workflow
			vim.keymap.set("n", "<Leader>tL", function()
				require("telescope.builtin").find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "Lazy search" })

			require("extra.telescope.multigrep").setup()
			-- @TODO: Review functionality and/or fix broken/misused pickers
			require("extra.telescope.vim_pickers").setup()
			require("extra.telescope.git_pickers").setup()
			require("extra.telescope.lsp_pickers").setup()

			-- @TODO: Add review community pickers and add any useful ones below
			-- Live-Grep Extension
			require("telescope").load_extension("live_grep_args")
		end,
	},
}
