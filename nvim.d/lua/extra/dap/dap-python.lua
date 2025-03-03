-- Python specific DAP configurations
local dap_py = require("dap-python")

-- get register adapter/configurations implictly from UV
dap_py.setup("uv")
-- set pytest runner
dap_py.test_runner = "pytest"

-- -- lua/extra/dap/python.lua
-- local M = {}
--
-- local dap = require("dap")
--
-- dap.adapters.python = {
--     type = "executable",
--     command = "python3",
--     args = { "-m", "debugpy.adapter" },
-- }
--
-- M.setup = function()
--     dap.configurations.python = {
--         {
--             type = "python",
--             request = "launch",
--             name = "Launch file",
--             program = "${file}",
--         },
--     }
-- end
--
-- return M
--
