-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		-- { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		-- { "<Left><Left>", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		{ "\\", ":Neotree reveal<CR>", silent = true },
		{ "<Left><Left>", ":Neotree reveal<CR>", silent = true },
	},
	opts = {
		close_if_last_window = true,
		window = {
			width = 30,
		},
		buffers = {
			follow_current_file = true,
		},
		filesystem = {
			follow_current_file = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignore = true,
				--hide_by_name = {
				--"node_modules"
				--}
			},
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
