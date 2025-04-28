-- experimental/test config for swenv

local SWENV = require("swenv.api")

-- @TESTING: Testing chatgpt fix for all 4 keymaps below
--

vim.keymap.set("n", "<Leader>cva", function()
	local ok, err = pcall(function()
		SWENV.auto_venv()
	end)
	if not ok then
		vim.notify("autovenv error: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Automake venv", noremap = true })

-- select venv from preset venv dir
vim.keymap.set("n", "<Leader>cvp", function()
	local ok, err = pcall(function()
		SWENV.pick_venv()
	end)
	if not ok then
		vim.notify("pick_venv: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Pick venv", noremap = true })

-- set venv dirpaths to check?? (review function in docs)
vim.keymap.set("n", "<Leader>cvs", function()
	local ok, err = pcall(function()
		SWENV.set_venv()
	end)
	if not ok then
		vim.notify("set_venv: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Search/Set venv", noremap = true })

-- view currently enabled venv, otherwise return None
vim.keymap.set("n", "<Leader>cvv", function()
	local ok, result = pcall(function()
		return SWENV.get_current_venv() -- @IMPORTANT: unlike other API functions above, this pcall() is testing the FUNCTIONS RETURN VALUE, not the function itself
	end)
	if ok then
		if result then
			-- assuming result is a table like { name = "...", path = "..." }
			vim.notify("current_venv: " .. (result.name or "Unknown"), vim.log.levels.INFO)
		else
			vim.notify("current_venv: None", vim.log.levels.INFO)
		end
	else
		vim.notify("get_current_venv error: " .. result, vim.log.levels.ERROR)
	end
end, { desc = "View current venv", noremap = true })
