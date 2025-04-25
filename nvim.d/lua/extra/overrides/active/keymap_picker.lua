local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")

local conf = require("telescope.config").values

local function get_mode_maps(mode)
	local maps = vim.api.nvim_get_keymap(mode)
	local results = {}
	for _, map in ipairs(maps) do
		table.insert(results, string.format("%s → %s [%s]", map.lhs, map.rhs, map.desc or map.mode))
	end
	return results
end

local function keymap_picker(mode)
	pickers
		.new({}, {
			prompt_title = "Keymaps: " .. mode,
			finder = finders.new_table({
				results = get_mode_maps(mode),
			}),
			sorter = conf.generic_sorter({}),
			previewer = previewers.new_buffer_previewer({
				define_preview = function(_, entry, status)
					local bufnr = status.bufnr

					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { entry.value })
				end,
			}),
		})
		:find()
end

return keymap_picker
