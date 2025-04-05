return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
				"<space>tf",
				require("telescope.builtin").find_files,
				{ desc = " Filetree [T]elescope" }
			)
			vim.keymap.set("n", "<space>tn", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "[T]elescope Neovim" })
			-- [s]earch [l]azy  -- @NOTE: This was copied from TJ and might not be needed for my workflow
			vim.keymap.set("n", "<space>tL", function()
				require("telescope.builtin").find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "Lazy [T]elescope" })

			-- extra pickers
			require("extra.telescope.multigrep").setup() -- only allows 1 selection
			require("extra.telescope.multigrep_extended").setup() -- allows multiple selections

			require("extra.telescope.vim_pickers").setup()
			require("extra.telescope.git_pickers").setup()
			require("extra.telescope.lsp_pickers").setup()

			-- @TODO: Review functionality and/or fix broken/misused pickers
			-- @TODO: Add review community pickers and add any useful ones below
		end,
	},
}
