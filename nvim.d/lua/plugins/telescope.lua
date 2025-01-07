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

			--vim.keymap.set("n", "<space>st", require("telescope.builtin").help_tags)	-- cmd remapped to <Leader>sh in telescope-config
			vim.keymap.set("n", "<space>sf", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<space>sn", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end)
			-- [s]earch [l]azy  -- @NOTE: This was copied from TJ and might not be needed for my workflow
			vim.keymap.set("n", "<space>sl", function()
				require("telescope.builtin").find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end)

			require("extra.telescope.multigrep").setup()
		end,
	},
}
