local M = {}

local ok, nord = pcall(require, "nord")
if not ok then
	vim.notify("Failed to load nord.nvim", vim.log.levels.ERROR)
	return
end

local ok_theme, highlights = pcall(require, "nord.integrations.bufferline")
if not ok_theme then
	vim.notify("Failed to load Nord bufferline highlights", vim.log.levels.ERROR)
	return
end

-- Override specific settings
highlights.fill.italic = false
highlights.background.italic = false

-- Return the modified theme
M.highlights = highlights
return M
