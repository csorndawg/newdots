-- experimental/test config for swenv

vim.keymap.set("n", "<Leader>cva", function()
	local autovenv = require("swenv.api").auto_venv
	local ok, err = pcall(autovenv)
	if not ok then
		vim.notify("auto_venv error: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Automake venv", noremap = true })

-- @TESTME: Testing "vim.notify" integration
vim.keymap.set(
	"n",
	"<Leader>cvp",
	-- <cmd>lua require('swenv.api').pick_venv()<cr>,
	function()
		local pickvenv = require("swenv.api").pick_venv
		local ok, err = pcall(pickvenv)
		if not ok then
			vim.notify("swenv pick venv error: " .. err, vim.log.levels.ERROR)
		end
	end,
	{ desc = "Pick venv", noremap = true }
)

-- -- @FFIXME:
vim.keymap.set("n", "<Leader>cvs", function()
	local setvenv = require("swenv.api").set_venv
	local ok, err = pcall(setvenv)
	if not ok then
		vim.notify("set_venv error: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Search/Set venv", noremap = true })

-- @TEST: vim.notify to display "get_current_venv" results
vim.keymap.set("n", "<Leader>cvv", function()
	local getvenvs = require("swenv.api").get_current_venv
	local ok, err = pcall(getvenvs)
	if ok then
		vim.notify("Current venv: " .. (getvenvs or "No active venv"), vim.log.levels.INFO)
	else
		vim.notify("get_current_venv error: " .. err, vim.log.levels.INFO)
	end
end, { desc = "View current venv", noremap = true })

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
