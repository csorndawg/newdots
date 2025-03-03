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
