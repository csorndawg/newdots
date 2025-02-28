-- Create keymap to custom telescope function that uses telescope to browse all
-- telescope extensions, pick an extensions, and load the selected picker within our session
vim.keymap.set("n", "<leader>te", function()
	local telescope = require("telescope")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	-- Get available extensions
	local extensions = vim.tbl_keys(telescope.extensions)

	if #extensions == 0 then
		vim.notify("No available Telescope extensions", vim.log.levels.WARN)
		return
	end

	-- Open picker to select extension
	pickers
		.new({}, {
			prompt_title = "Telescope Extensions",
			finder = finders.new_table({ results = extensions }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", function()
					local selection = action_state.get_selected_entry()
					if selection then
						actions.close(prompt_bufnr)
						-- Load the selected extension
						vim.cmd("Telescope " .. selection[1])
					end
				end)
				return true
			end,
		})
		:find()
end, { desc = "Browse and load Telescope extensions" })
