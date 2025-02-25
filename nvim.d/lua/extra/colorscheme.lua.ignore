-- Colorscheme Configurations

local M = {}
M.setup = function()
	-- set colorscheme configs before colorscheme itself
	vim.g.nord_contrast = false
	vim.g.nord_borders = true
	vim.g.nord_disable_background = false
	vim.g.nord_italic = true
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = true
	-- Load the colorscheme
	require("nord").set()
end

-- configure headlines bufferline integration
-- local ok, headlines = pcall(require, "headlines")
-- if ok then
-- 	headlines.setup({
-- 		markdown = {
-- 			headline_highlights = {
-- 				"Headline1",
-- 				"Headline2",
-- 				"Headline3",
-- 				"Headline4",
-- 				"Headline5",
-- 				"Headline6",
-- 			},
-- 			codeblock_highlight = "CodeBlock",
-- 			dash_highlight = "Dash",
-- 			quote_highlight = "Quote",
-- 		},
-- 	})
-- else
-- 	vim.notify("headlines.nvim not found!", vim.log.levels.WARN)
-- end
return M
