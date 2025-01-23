require("neo-tree").setup({
	window = {
		mappings = {
			["/"] = "filter_as_you_type", -- Start filtering with regex
			["<CR>"] = "clear_filter", -- Press Enter to apply the filter and jump to the panel
			["<esc>"] = "clear_filter", -- Clear the filter and reset the view
			["j"] = "move_down", -- Navigate down through filtered results
			["k"] = "move_up", -- Navigate up through filtered results
		},
	},
	filesystem = {
		filtered_items = {
			visible = true, -- Ensure filtered items are displayed
		},
	},
})
