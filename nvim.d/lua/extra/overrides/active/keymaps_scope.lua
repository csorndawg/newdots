local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

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

local function get_mode_keymaps(mode)
	local maps = vim.api.nvim_get_keymap(mode)
	local formatted = {}
	for _, map in ipairs(maps) do
		table.insert(formatted, string.format("%-10s → %s", map.lhs, map.rhs))
	end
	return formatted
end

local function keymap_picker_by_mode()
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
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					local mode = selection.value
					local keymaps = get_mode_keymaps(mode)
					pickers
						.new({}, {
							prompt_title = "Keymaps: " .. mode_names[mode],
							finder = finders.new_table({ results = keymaps }),
							sorter = conf.generic_sorter({}),
						})
						:find()
				end)
				return true
			end,
		})
		:find()
end

-- 🗺️ Define the keybinding here directly
vim.keymap.set(
	"n",
	"<leader>z9m",
	keymap_picker_by_mode,
	-- { desc = "View/Filter Keymaps by mode" })
	{ desc = "Telescope: Keymaps by mode" }
)

-- Optional: return it if other modules want to call it
return keymap_picker_by_mode
