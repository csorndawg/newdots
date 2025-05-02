return {
	{
		"folke/snacks.nvim", -- correct repo
		priority = 1000, -- optional: make it load early
		lazy = false, -- load on startup (important for UI plugins)
		opts = {
			picker = {
				enabled = true,
				backend = "telescope", -- or "vim.ui.select", "mini.pick"
				theme = "ivy", -- optional: "ivy", "dropdown", "cursor"
			},
			input = {
				enabled = true,
				style = "minimal",
				relative = "editor",
				width = 40,
				height = 1,
				row = math.floor(vim.o.lines / 2 - 1),
				col = math.floor(vim.o.columns / 2 - 20),
				border = "rounded",
			},
			notifier = {
				enabled = true,
				timeout = 2400, -- milliseconds
				level = vim.log.levels.DEBUG,
				style = "compact",
				top_down = true,
				date_format = "%R",
				padding = true,
				sort = { "level", "added" },
			},
			scratch = {
				enabled = true,
			},
			-- disable unrelated modules
			animate = { enabled = false },
			bigfile = { enabled = false },
			bufdelete = { enabled = false },
			dashboard = { enabled = false },
			debug = { enabled = false },
			dim = { enabled = false },
			explorer = { enabled = false },
			git = { enabled = false },
			gitbrowse = { enabled = false },
			image = { enabled = false },
			indent = { enabled = false },
			layout = { enabled = false },
			lazygit = { enabled = false },
			profiler = { enabled = false },
			rename = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			terminal = { enabled = false },
			toggle = { enabled = false },
			util = { enabled = false },
			win = { enabled = false },
			words = { enabled = false },
			zen = { enabled = false },
		},
		keys = {
			{
				"<leader>sp",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratchpad",
			},
			{
				"<leader>ss",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
		},
	},
}
