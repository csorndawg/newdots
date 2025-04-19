-- experimental/test config for swenv
local M = {}
local SWENV = require("swenv.api")

-- automate new venv directory creation and activation
-- @NOTE: Commenting out since I only want autovenv to run ocassionally. Sometimes I will want to reuse
--        existing venv, and other times I want a fresh one for a fresh project.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		SWENV.auto_venv()
	end,
})

-- NOTE: Move all VENV code actions to 'V' subgroup label (<leader>cv). Can also
--        move to "Python" subgroup label if not enough actions to warrant 'V'.

vim.keymap.set("n", "<Leader>cva", ":lua SWENV.auto_venv()<cr>", { desc = "Automake venv" })
vim.keymap.set("n", "<Leader>cvp", ":lua SWENV.pick_venv()<cr>", { desc = "Pick venv" })
vim.keymap.set("n", "<Leader>cvv", ":lua SWENV.get_current_venv()<cr>", { desc = "View current venv" })
vim.keymap.set("n", "<Leader>cvs", ":lua SWENV.set_venv()<cr>", { desc = "Search/Set venv" })

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
