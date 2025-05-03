-- lua/extra/telescope_zoxide.lua

local z_utils = require("telescope._extensions.zoxide.utils")

-- Set extension options *without resetting the entire config*
require("telescope").extensions.zoxide = {
	prompt_title = "[ Walking on the shoulders of TJ ]",
	mappings = {
		default = {
			after_action = function(selection)
				print("Update to (" .. selection.z_score .. ") " .. selection.path)
			end,
		},
		["<C-s>"] = {
			before_action = function(selection)
				print("before C-s")
			end,
			action = function(selection)
				vim.cmd.edit(selection.path)
			end,
		},
		["<C-g>"] = { action = z_utils.create_basic_command("vsplit") },
	},
}

-- Load the extension
require("telescope").load_extension("zoxide")

-- Keymap
vim.keymap.set("n", "<Leader>Tz", "<cmd>Telescope zoxide list<CR>", {
	desc = "Zoxide",
	noremap = true,
})
