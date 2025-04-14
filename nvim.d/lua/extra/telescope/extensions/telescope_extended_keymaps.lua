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

-- cheatsheet extension configuration
pcall(require, "cheatsheet").setup({
	-- generic cheatsheets
	--bundled_cheatsheets = false, -- disable built-in sheets
	bundled_cheetsheets = {
		enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
		disabled = { "nerd-fonts" },
	},

	-- plugin-specific cheatsheets
	-- bundled_plugin_cheatsheets = false, -- disable plugin sheets
	bundled_plugin_cheatsheets = {
			enabled = {
"goto-preview",
"telescope.nvim",
},
			disabled = {
          "auto-session",
          "octo.nvim",
          "gitsigns",
          "vim-easy-align",
          "vim-sandwich",
	},
  }

	include_only_installed_plugins = false,
	cheat_file_dirs = {
		-- full path to your repo
		["Comm"] = vim.fn.expand("~/.config/cheat/cheatsheets/community"),
		["Tscope"] = vim.fn.expand("~/.config/cheat/cheatsheets/telescope"),
	},
})

-- setup/config for commander extension
pcall(require, "commander").setup({
	components = {
		"DESC",
		"KEYS",
		"CAT",
	},
})
