return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",

		config = function()
			-- default configurations
			require("copilot").setup({
				panel = {
					enabled = true,
					-- enabled = false, -- setting to 'false' as per copilot-cmp docs
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "vertical", -- | top | left | right | horizontal | vertical

						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = false, -- setting to 'false' as per copilot-cmp docs

					auto_trigger = false,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,

						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",

						dismiss = "<C-]>",
					},
				},
				-- copilot disabled for all filetypes by default, unless set to "true" below
				-- additional FTs to (potentially) enable: awk, crontab, make, ini, gitcommit, git, fugitive, oil, sed
				filetypes = {
					bash = true,
					cheat = true,
					conf = true,
					dockerfile = true,
					gitignore = true,
					lua = true,
					mysql = true,
					psql = true,
					python = true,
					sh = true,
					sql = true,
					tmux = true,
					toml = true,
					vim = true,
					yaml = true,
					zsh = true,
					-- gitcommit = false,
					["*"] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
}
