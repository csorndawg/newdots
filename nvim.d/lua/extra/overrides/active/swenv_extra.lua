-- experimental/test config for swenv

-- @FIXME:
-- @FIXME:
-- vim.keymap.set(
-- 	"n",
-- 	"<Leader>cva",
-- 	<cmd>lua require('swenv.api').auto_venv()<cr>,
-- 	{ desc = "Automake venv", noremap = true }
-- )

-- @TESTME: Testing "vim.notify" integration
vim.keymap.set(
	"n",
	"<Leader>cvp",
	-- <cmd>lua require('swenv.api').pick_venv()<cr>,
	function()
		local ok, err = pcall(require("swenv.api").pick_venv)
		if not ok then
			vim.notify("swenv pick venv error: " .. err, vim.log.levels.ERROR)
		end
	end,
	{ desc = "Pick venv", noremap = true }
)

-- -- @FIXME:
-- vim.keymap.set(
-- 	"n",
-- 	"<Leader>cvs",
-- 	<cmd>lua require('swenv.api').get_current_venv()<cr>,
--
-- 	{ desc = "Search/Set venv", noremap = true }
-- )
--

-- @TEST: vim.notify to display "set_venv" results
vim.keymap.set("n", "<Leader>cvv", function()
	local venv = require("swenv.api").set_venv()
	vim.notify("Current venv: " .. (venv or "No active venv"), vim.log.levels.INFO)
end, { desc = "View current venv", noremap = true })

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
