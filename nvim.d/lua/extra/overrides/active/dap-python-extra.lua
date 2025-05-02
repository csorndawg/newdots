-- DAP Python extended configuration

-- @DEBUGGING

-- local dap = require("dap")
-- vim.notify("Sucessfully loaded [dap]")

-- local dappy = require("rc.d.overrides.active.dap-bash")
-- vim.notify("Sucessfully loaded [dap-python]")

local swenvv = require("swenv")
-- vim.notify("Sucessfully loaded [swenv]")
--
-- -- register UV with DAP adapter/configurations
-- local ok, err = pcall(function()
-- 	dappy.setup("uv")
-- end)
--
-- if ok then
-- 	vim.notify("dap-python set up with 'uv'")
-- else
-- 	vim.notify("Error setting up dap-python: " .. err, vim.log.levels.ERROR)
-- end

-- print venv test
-- swenvv.get_

-- @TESTME: Test swenv autocmd for getting list of all available venvs

-- -- require('swenv').setup({
-- swenvv.setup({
--   -- Should return a list of tables with a `name` and a `path` entry each.
--   -- Gets the argument `venvs_path` set below.
--   -- By default just lists the entries in `venvs_path`.
--   get_venvs = function(venvs_path)
--     return require('swenv.api').get_venvs(venvs_path)
--   end,
--   -- Path passed to `get_venvs`.
--   venvs_path = vim.fn.expand('~/.local/state/python/uv/venvs'),
--   -- Something to do after setting an environment, for example call vim.cmd.LspRestart
--   post_set_venv = nil,
-- })
--
