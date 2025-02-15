-- Colorscheme Configurations

-- Colorscheme
-- set colorscheme configs before colorscheme itself
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

-- enable colorscheme after its configs set
vim.cmd.colorscheme("nord")
--vim.cmd.colorscheme('nordic')

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
