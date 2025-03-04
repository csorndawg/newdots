-- Config file for custom DAP keybinds
local dap = require("dap")
local dapui = require("dapui")
local neotest = require("neotest")

-- Example Mapping
-- Debug Step Over
vim.keymap.set("n", "<leader>dv", function()
	dap.step_over()
end, { noremap = true, desc = "Step Over" })

-- DAP-UI Toggle
vim.keymap.set("n", "<leader>dt", function()
	dapui.toggle()
end, { desc = "Toggle DAP-UI", noremap = true })

-- @WIPs

-- runs nearest test
vim.keymap.set("n", "<leader>dm", function()
	neotest.run.run()
end, { desc = "Test Method", noremap = true })

-- runs nearest test in debug mode
vim.keymap.set("n", "<leader>dM", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "DAP Test Method", noremap = true })

-- runs all tests in file
vim.keymap.set("n", "<leade>df", function()
	neotest.run.run({ vim.fn.expand("%") })
end, { desc = "Test Class", noremap = true })

-- runs all tests in file in Debug mode
vim.keymap.set("n", "<leader>dF", function()
	neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
end, { desc = "DAP Test Class", noremap = true })

-- display test summary
vim.keymap.set("n", "<leader>dS", function()
	neotest.summary.toggle()
end, { desc = "Test Summary", noremap = true })
