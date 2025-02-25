-- Colorscheme Configurations
local nord = require("nord")
local colors = require("nord.colors")

-- Colorscheme
-- set colorscheme configs before colorscheme itself
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_cursorline_transparent = false
-- vim.g.nord_disable_background = true
vim.g.nord_disable_background = true    -- DO NOT set to false, it will just turn bg black
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

-- enable colorscheme after its configs set
vim.cmd.colorscheme("nord")
--vim.cmd.colorscheme('nordic')

-- Bufferline
-- <CODE HERE>
local highlights = require("nord").bufferline.highlights({
	-- italic = true,
	-- bold = true,
	fill = "#181c24",
	-- fill = colors.nord0_gui,
	indicator = colors.nord9_gui,
	bg = colors.nord1_gui,
	buffer_bg = colors.nord3_gui,
	-- buffer_bg_selected = colors.nord11_gui,
	buffer_bg_selected = colors.nord1_gui,
	buffer_bg_visible = "#2A2F3A",
})

require("bufferline").setup({
	options = {
		separator_style = "thin",
	},
	highlights = highlights,
})
