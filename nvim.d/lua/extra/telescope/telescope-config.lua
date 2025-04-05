-- Telescope Post-Build Configuration

local builtin = require("telescope.builtin")

-- create remaps for core telescope actions
--vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>bt", builtin.buffers, { desc = "[B]uffers [T]elescope" }) -- alternate keymap for "Buffers" subkey
vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Help tags" })

-- Cherry-picked configuration recipes from: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes

-- Clear prompt with <C-u>
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
			},
		},
	},
})

-- toggle previewer (if applicable) with <Alt-p>
local action_layout = require("telescope.actions.layout")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<M-p>"] = action_layout.toggle_preview,
			},
			i = {
				["<M-p>"] = action_layout.toggle_preview,
			},
		},
	},
})

-- remove './' from FD results
require("telescope").setup({
	defaults = {
		-- ....
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},
})

-- Dont show binary files in previewer
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = vim.split(j:result()[1], "/")[1]
			if mime_type == "text" then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			else
				-- maybe we want to write something to the buffer here
				vim.schedule(function()
					--vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Not Previewable" })
				end)
			end
		end,
	}):sync()
end

require("telescope").setup({
	defaults = {
		buffer_previewer_maker = new_maker,
	},
})
