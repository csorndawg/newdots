-- experimental/test config for swenv

-- @NOTE: Keymap copnfiguration not loaded when "local M" module present. Removing and retesting.
-- local M = {}

-- local SWENV = require("swenv.api")
--
-- -- automate new venv directory creation and activation
-- -- @NOTE: Commenting out since I only want autovenv to run ocassionally. Sometimes I will want to reuse
-- --        existing venv, and other times I want a fresh one for a fresh project.
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "python" },
-- 	callback = function()
-- 		SWENV.auto_venv()
-- 	end,
-- })
--
-- NOTE: Move all VENV code actions to 'V' subgroup label (<leader>cv). Can also
--        move to "Python" subgroup label if not enough actions to warrant 'V'.

vim.keymap.set(
	"n",
	"<Leader>cva",
	"<cmd>llua require'swenv.api').auto_venv()<cr>",
	{ desc = "Automake venv", noremap = true }
)
vim.keymap.set(
	"n",
	"<Leader>cvp",
	"<cmd>lua require'swenv.api').pick_venv()<cr>",
	{ desc = "Pick venv", noremap = true }
)
vim.keymap.set(
	"n",
	"<Leader>cvv",
	"<cmd>lua require'swenv.api').get_current_venv()<cr>",
	{ desc = "View current venv", noremap = true }
)
vim.keymap.set(
	"n",
	"<Leader>cvs",
	"<cmd>lua require'swenv.api').set_venv()<cr>",
	{ desc = "Search/Set venv", noremap = true }
)

-- @TODO: Load 'lualine' and add SWENV info to lualine section
-- swenv docs copypasta

-- --  add to lualine component
-- sections = {
--         ...
--         lualine_a = 'swenv' -- uses default options
--         lualine_x = { 'swenv', icon = '<icon>' } -- passing lualine component options
--         ...
--     }
--
-- -- only show if FT=python
--     {
--         "swenv",
--         cond = function()
--             return vim.bo.filetype == "python"
--
--         end,
--     }

-- return M
