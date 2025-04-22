-- experimental/test config for swenv

vim.keymap.set(
	"n",
	"<Leader>cva",
  function()
    local ok, err = pcall(require('swenv.api').auto_venv)
    if not ok then
    vim.notify("auto_venv error: ", .. err, vim.log.levels.ERROR)
	{ desc = "Automake venv", noremap = true }
)

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

-- -- @FFIXME:
vim.keymap.set(
	"n",
	"<Leader>cvs",
  function()
    local ok, err = pcall(require("swenv.api").set_venv)
    if not ok then
      vim.notify.("set_venv error: " .. err, vim.log.levels.ERROR )
    end
  end,
	{ desc = "Search/Set venv", noremap = true }
)


-- @TEST: vim.notify to display "get_current_venv" results
vim.keymap.set("n", "<Leader>cvv", function()
	local venv = require("swenv.api").get_current_venv
	vim.notify("Current venv: " .. (venv or "No active venv"), vim.log.levels.INFO)
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
