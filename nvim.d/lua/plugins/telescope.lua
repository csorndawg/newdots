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
