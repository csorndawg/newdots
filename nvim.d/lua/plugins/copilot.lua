return {

	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",

	-- default copilot.lua configuration
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right | horizontal | vertical
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
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
			filetypes = {
				-- yaml = false,
				-- markdown = false,
				-- help = false,
				-- gitcommit = false,
				-- gitrebase = false,
				-- hgcommit = false,
				-- svn = false,
				-- cvs = false,
				--["."] = -- false,
				python = true,
				bash = true,
				sql = true,
				sh = true,
				-- @TODO: Run cmp tests for above filetypes, if successful expand the included filetypes to also
				-- 	      include "yaml", "lua", "vim", "tmux", "docker", and "ansible" in that order.
				["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
