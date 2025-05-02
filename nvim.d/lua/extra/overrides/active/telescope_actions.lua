-- Modify Telescope's `help_tags` action to use vertical split
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

require("telescope").setup({
	pickers = {
		man_pages = {
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd("vertical rightbelow help " .. selection.value) -- Open help in vertical split
				end)
				return true
			end,
		},
		help_tags = {
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd("vertical rightbelow help " .. selection.value) -- Open help in vertical split
				end)
				return true
			end,
		},
	},
})
