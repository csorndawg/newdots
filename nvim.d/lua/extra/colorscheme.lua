-- Colorscheme++ Configurations

-- Colorscheme: Nordbones

-- enable dark background before enabling zenbones
vim.o.termguicolors = true
vim.o.background = dark
--vim.cmd.colorscheme("forestbones")
--vim.cmd.colorscheme("zenburned")
vim.cmd.colorscheme("nordbones")

-- @TESTME
-- Nordbones Configuration Options
--vim.g.nordbones = {
vim.g.zenburned = {
	solid_line_nr = true,
	darken_comments = 45,
	-- lighten_cursor_line = 8,
}

-- Bufferline
-- <CODE HERE>
local highlights = require("nord").bufferline.highlights({
	italic = true,
	bold = true,
})

require("bufferline").setup({
	options = {
		separator_style = "thin",
	},
	highlights = highlights,
})

-- LuaLine
-- <CODE HERE>
-- copying default configuration as starting point
require("lualine").setup({
	options = {
		--theme == "zenburned",
		--theme == "nord",
		theme == "nordbones",
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "location", "progress" },
		lualine_z = { "filename" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "fileformat", "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

--
