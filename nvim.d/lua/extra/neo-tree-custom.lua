require("neo-tree").setup({
	window = {
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
			},
			["?"] = "show_help",
			["/"] = "filter_as_you_type", -- Start filtering with regex
			["<CR>"] = "open", -- Press Enter to apply the filter and jump to the panel
			["O"] = "open_vsplit", -- Press Enter to apply the filter and jump to the panel
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			["<esc>"] = "clear_filter", -- Clear the filter and reset the view
			["j"] = "move_down", -- Navigate down through filtered results
			["k"] = "move_up", -- Navigate up through filtered results

			-- -- @TODO: Review neotree doc COPYPASTA mappings, remove unused mappings, add/modify useful ones
			-- ["C"] = "close_node",
			--["9"] = "close_all_subnodes",
			["C"] = "close_node",
			["Q"] = "close_all_subnodes",
			--["0"] = "close_all_nodes",
			-- --["Z"] = "expand_all_nodes",
			-- ["a"] = {
			--"-- add",
			-- -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
			-- -- some commands may take optional config options, see `:h neo-tree-mappings` for details
			-- config = {
			-- show_path = "none" -- "none", "relative", "absolute"
			-- }
			--},
			-- ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			-- ["d"] = "delete",
			-- ["r"] = "rename",
			-- ["b"] = "rename_basename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			-- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			-- -- ["c"] = {
			-- --  "copy",
			-- --  config = {
			-- --    show_path = "none" -- "none", "relative", "absolute"
			-- --  }
			-- --}
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",

			-- ["<"] = "prev_source",
			-- [">"] = "next_source",
			-- ["i"] = "show_file_details",
			-- -- ["i"] = {
			-- --   "show_file_details",
			-- --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
			-- --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
			-- --   -- config = {
			-- --   --   created_format = "%Y-%m-%d %I:%M %p",
			-- --   --   modified_format = "relative", -- equivalent to the line below
			-- --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
			-- --   -- }
			-- -- },
		},
	},
	filesystem = {
		filtered_items = {
			visible = true, -- Ensure filtered items are displayed
			-- @TODO: Explore hidden file features and update below as needed once familar
			-- @EXPERIMENTAL
			-- @TESTLATER
			hide_dotfiles = true,
			hide_gitignored = true,
			--hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				"node_modules",
				"IgnoreMe",
			},
			hide_by_pattern = { -- uses glob style patterns
				"*.gig",
				"*.zip",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				".gitignored",
				".gitignore",
			},
		},
	},
})
