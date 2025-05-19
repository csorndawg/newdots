-- Telescope Post-Build Configuration

local builtin = require("telescope.builtin")

-- create remaps for core telescope actions
-- vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>bs", builtin.buffers, { desc = "Buffers search" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Buffers search" })
vim.keymap.set("n", "<leader>tvh", builtin.help_tags, { desc = "Help tags search" })
vim.keymap.set("n", "<leader>ta", "<cmd>Telescope builtin <cr>", { noremap = true, desc = "All builtin telescopes" })

-- Cherry-picked configuration recipes from: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes

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
			mappings = {
				n = {
					["kj"] = "close",
					["cd"] = function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry()
						local dir = vim.fn.fnamemodify(selection.path, ":p:h")
						require("telescope.actions").close(prompt_bufnr)
						-- Depending on what you want put `cd`, `lcd`, `tcd`
						vim.cmd(string.format("silent lcd %s", dir))
					end,
				},
			},
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

-- Help/Which mappings for current picker

-- clear prompt
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- toggle all picker items (switch to C-z if name issue occurs)
				["<M-u>"] = require("telescope.actions").preview_scrolling_up,
				["<C-u>"] = false,
				["<C-c>"] = require("telescope.actions").close,
			},
		},
	},
})

-- swap  send all selec/se
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- swap send to quickfix default mappings
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- selected only
				["<S-q>"] = actions.add_selected_to_qflist + actions.open_qflist, -- append selected-only to quickfix
				["<M-x>"] = actions.send_to_qflist + actions.open_qflist, -- send unselected only
				["<C-a>"] = actions.toggle_all,
				["<C-z>"] = function(prompt_bufnr)
					require("telescope.actions").which_key(prompt_bufnr)
				end,
			},
			n = {
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-x>"] = actions.send_to_qflist + actions.open_qflist, -- send unselected only
				["?"] = function(prompt_bufnr)
					require("telescope.actions").which_key(prompt_bufnr)
				end,
			},
		},
	},
})
