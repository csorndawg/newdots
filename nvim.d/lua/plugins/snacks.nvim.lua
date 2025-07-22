return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		notifier = {
			enabled = true,
			view = "mini", -- or "native", "notify"
			timeout = 4000,
			level = vim.log.levels.INFO,
			stages = "fade_in_slide_out",
		},
		notify = {
			enabled = true,
			level = vim.log.levels.INFO,
			timeout = 5000,
			render = "default",
		},
		input = {
			enabled = true,
			border = "rounded",
			relative = "editor", -- can be win, cursor, editor
			win_options = {
				winblend = 10,
			},
		},
		picker = {
			enabled = true,
			backend = "telescope", -- or "builtin" for snacks-native
			mappings = {

				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		scratch = {
			enabled = true,
			default_filetype = "lua",
			border = "single",
			mappings = {
				normal = {
					["<leader>SS"] = "<cmd>ScratchNew<CR>",
				},
			},
		},

		terminal = {
			enabled = true,
			border = "double",
			float_opts = {
				width = 0.9,
				height = 0.8,
			},
			mappings = {
				toggle = "<leader>tt", -- toggle terminal
				new = "<leader>tn", -- new terminal window
			},
		},
		util = {
			enabled = true,
			auto_cd_root = true,
		},
		git = {
			enabled = true,
			signs = true,
			blame_line = true,
			-- mappings = {
			-- 	["<leader>gs"] = "<cmd>SnacksGitStatus<CR>",
			-- 	["<leader>gb"] = "<cmd>SnacksGitBlameLine<CR>",
			-- },
		},
		lazygit = {
			enabled = true,
			-- mapping = "<leader>gz", -- launches lazygit popup
			layout = {
				width = 0.9,
				height = 0.9,
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- Optional: Add custom commands
		vim.api.nvim_create_user_command("SnackTerm", function()
			require("snacks.terminal").open()
		end, {})

		vim.api.nvim_create_user_command("SnackScratch", function()
			require("snacks.scratch").open()
		end, {})
	end,
}
