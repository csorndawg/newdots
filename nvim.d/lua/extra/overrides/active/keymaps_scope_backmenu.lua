local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local mode_names = {
	n = "Normal",
	i = "Insert",
	v = "Visual",
	x = "Visual (Block)",
	s = "Select",
	o = "Operator-pending",
	c = "Command-line",
	t = "Terminal",
}

-- Stack to track mode history (max depth 5)
local mode_stack = {}

local function get_mode_keymaps(mode)
	local maps = vim.api.nvim_get_keymap(mode)
	local formatted = { "🔙 Back" }
	for _, map in ipairs(maps) do
		table.insert(formatted, string.format("%-10s → %s", map.lhs, map.rhs))
	end
	return formatted
end

local function show_mode_keymaps(mode)
	-- Save to stack (cap at 5)
	table.insert(mode_stack, mode)
	if #mode_stack > 5 then
		table.remove(mode_stack, 1)
	end

	pickers
		.new({}, {
			prompt_title = "Keymaps: " .. mode_names[mode],
			finder = finders.new_table({
				results = get_mode_keymaps(mode),
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry().value
					actions.close(prompt_bufnr)

					if selection == "🔙 Back" then
						-- Pop current mode off the stack
						table.remove(mode_stack)
						local previous = mode_stack[#mode_stack]
						if previous then
							-- Show previous mode again
							table.remove(mode_stack) -- pop again to prevent duplicate push
							show_mode_keymaps(previous)
						else
							-- Stack empty → go back to mode selector
							mode_stack = {}
							require("extra.overrides.active.keymaps_scope_backmenu").start()
						end
					end
				end)
				return true
			end,
		})
		:find()
end

-- Entry point
local M = {}

function M.start()
	mode_stack = {} -- Reset stack
	pickers
		.new({}, {
			prompt_title = "Select Mode for Keymaps",
			finder = finders.new_table({
				results = vim.tbl_keys(mode_names),
				entry_maker = function(mode)
					return {
						value = mode,
						display = string.format("%s (%s)", mode_names[mode], mode),
						ordinal = mode,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					show_mode_keymaps(selection.value)
				end)
				return true
			end,
		})
		:find()
end

-- Optional keymap
vim.keymap.set(
	"n",
	"<leader>z9B",
	-- keymap_picker_by_mode,
	M.start,
	{ desc = "Telesearch Keymaps w/ multiple jump backs" }
)

return M
