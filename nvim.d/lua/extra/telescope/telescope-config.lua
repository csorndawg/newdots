-- Telescope Post-Build Configuration

local builtin = require("telescope.builtin")

-- create remaps for core telescope actions
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })   -- not needed because of "multigrep" custom grep function/action
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })

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

-- @FIXME: Fallback to find_files functionality is broken

---- fallback to find_files if git_files cant find .git directory
---- telescope-config.lua
--local M = {}
--
---- We cache the results of "git rev-parse"
---- Process creation is expensive in Windows, so this reduces latency
--local is_inside_work_tree = {}
--
--M.project_files = function()
--  local opts = {} -- define here if you want to define something
--
--  local cwd = vim.fn.getcwd()
--  if is_inside_work_tree[cwd] == nil then
--    vim.fn.system("git rev-parse --is-inside-work-tree")
--    is_inside_work_tree[cwd] = vim.v.shell_error == 0
--  end
--
--  if is_inside_work_tree[cwd] then
--    require("telescope.builtin").git_files(opts)
--  else
--    require("telescope.builtin").find_files(opts)
--  end
--end
--
--return M
--
---- call via:
---- :lua require"telescope-config".project_files()
--
---- remap find_files fallback to <Leader>sp  (think  <leader> [s]earch [p]roject)
----vim.api.nvim_set_keymap("n", "<Leader>sp", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})
--

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
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
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
