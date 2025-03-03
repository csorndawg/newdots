-- Python specific DAP configurations
local dap_py = require("dap-python")

-- get register adapter/configurations implictly from UV
dap_py.setup("uv")
-- set pytest runner
dap_py.test_runner = "pytest"
