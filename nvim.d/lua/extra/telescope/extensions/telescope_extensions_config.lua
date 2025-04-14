-- Custom keymaps for "extended" Telescope functionality (eg. extensions, custom enhancements, etc.)

-- NOTE: All extended Telescope mappings should fall under 'T' whichkey subgroup
--       since all "core" mappings are under lowercase "t" grouping

-- lua/extra/telescope_installed_extensions_config.lua

local telescope = require("telescope")

telescope.setup({
	extensions = {
		z = {
			prompt_title = "Jump to recent dir",
		},
		tmux = {
			sort_by = "recent", -- optional config
		},
		luasnip = {
			include_pattern = ".*",
			include_langs = function(lang)
				return true
			end,
		},
	},
})

-- Load all extensions safely
local extensions = {
	"z",
	"cheatsheet",
	"commander",
	"tmux",
	"luasnip",
}

for _, ext in ipairs(extensions) do
	pcall(telescope.load_extension, ext)
end

-- Optional: setup for standalone plugins
pcall(require, "cheatsheet").setup({})
pcall(require, "commander").setup({
	components = {
		"DESC",
		"KEYS",
		"CAT",
	},
})
