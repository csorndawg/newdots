-- DAP config source file
-- This file defines which DAP config files (and in what order) are sourced

-- @TEST: check luadocs for nested init.lua sourcing syntax
-- require('dap-general')

-- dap configs that will be sourced
local dap_configs = {
	"extra.dap.dap-general",
	"extra.dap.dap-utils",
	"extra.dap.dap-keybinds",
	"extra.dap.python",
}

-- load each module from above table
for _, module in ipairs(dap_configs) do
	local ok, mod = pcall(require, module)
	if ok and type(mod) == "table" and mod.setup then
		mod.setup()
	elseif not ok then
		vim.notify("Failed to load " .. module, vim.log.levels.WARN)
	end
end
