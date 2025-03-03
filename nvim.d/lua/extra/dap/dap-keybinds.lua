-- Config file for custom DAP keybinds
local dap = require("dap")
local dapui = require("dapui")

-- Example Mapping
-- Debug Step Over
vim.keymap.set("n", "<leader>dv", function()
	dap.step_over()
end, { noremap = true, desc = "Step Over" })

-- DAP-UI Toggle
vim.keymap.set("n", "<leader>dt", function()
	dapui.toggle()
end, { desc = "Toggle DAP-UI", noremap = true })
