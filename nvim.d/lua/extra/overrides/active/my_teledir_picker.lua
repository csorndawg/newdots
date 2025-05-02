-- lua/extra/my_directory_picker.lua
local M = {}

local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local scan = require("plenary.scandir")

-- dir for persistent/reusable venvs generated via "uv"
local predefined_root = vim.fn.expand("~/.local/state/python/uv/venvs")

-- stores the selected directory (can be accessed externally)
M.selected_directory = nil

local function get_dirs(path, opts)
	return scan.scan_dir(
		path,
		vim.tbl_deep_extend("force", {
			only_dirs = true,
			silent = true,
		}, opts or {})
	)
end

-- also check for any Venvs in CWD filetree, and add any to Telescope picker selection list
local function get_valid_venv_dirs(base_path)
	local all_dirs = scan.scan_dir(base_path, {
		only_dirs = true,
		hidden = true,
		depth = nil,
	})

	local function has_pyvenv_cfg(dir)
		return vim.fn.filereadable(Path:new(dir, "pyvenv.cfg"):absolute()) == 1
	end

	local valid_dirs = {}
	for _, dir in ipairs(all_dirs) do
		if has_pyvenv_cfg(dir) then
			table.insert(valid_dirs, vim.fn.fnamemodify(dir, ":p"))
		end
	end

	return valid_dirs
end

-- functions for fetching/activating venv from Telescope picker selection
local function find_activate_script(base_dir)
	local matches = scan.scan_dir(base_dir, {
		depth = nil,
		search_pattern = "bin/activate$",
		add_dirs = false,
		hidden = true,
	})
	return matches[1]
end

local function launch_tmux_split(activate_path)
	local cmd =
		string.format([[tmux split-window -h "bash -c 'source %s; exec $SHELL'"]], vim.fn.fnameescape(activate_path))
	vim.fn.system(cmd)
end

function M.pick_directory()
	local results_set = {}

	-- Add top-level project dirs
	for _, dir in ipairs(get_dirs(predefined_root, { depth = 1 })) do
		results_set[vim.fn.fnamemodify(dir, ":p")] = true
	end

	-- Add filtered CWD subdirs with pyvenv.cfg
	for _, dir in ipairs(get_valid_venv_dirs(vim.fn.getcwd())) do
		results_set[dir] = true
	end

	local results = vim.tbl_keys(results_set)
	table.sort(results)

	pickers
		.new({}, {
			prompt_title = "Select a Directory",
			finder = finders.new_table({ results = results }),
			sorter = conf.generic_sorter({}),

			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if not selection then
						return
					end

					local venv_path = Path:new(selection[1])
					local activate_path = venv_path:joinpath("bin", "activate"):absolute()

					if vim.fn.filereadable(activate_path) ~= 1 then
						vim.notify("No 'bin/activate' found in " .. activate_path, vim.log.levels.WARN)
						return
					end

					-- Get current buffer path
					local buf_path = vim.api.nvim_buf_get_name(0)
					local is_abs = vim.fn.fnamemodify(buf_path, ":p") == buf_path and buf_path ~= ""

					-- Construct tmux command
					local tmux_cmd = is_abs
							and string.format(
								[[tmux split-window -h 'source "%s" && nvim "%s"']],
								activate_path,
								buf_path
							)
						or string.format([[tmux split-window -h 'source "%s"']], activate_path)

					vim.fn.system(tmux_cmd)
				end)

				return true
			end,
		})
		:find()
end

-- define keymaps that reference logic defined above
vim.keymap.set("n", "<leader>cvp", function()
	M.pick_directory()
end, { desc = "Pick venv to activate in Tmux split" })

-- return module with function and keymaps
return M
