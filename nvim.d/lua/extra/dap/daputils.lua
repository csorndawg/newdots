-- Source: https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#2-clear-the-lua-package-cache-and-reload-the-configuration-module

local M = {}
local dap = require("dap")

function M.reload_continue()
	package.loaded["dap_config"] = nil
	require("dap_config")
	dap.continue()
end

local opts = { noremap = false, silent = true }

-- <Leader>ec to continue
-- vim.api.nvim_buf_set_keymap(0, "n", "<Leader>ec", '<cmd>lua require"dap".continue()<CR>', { desc = "DAP Cont." })

-- <Leader>eC to reload and then continue
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<Leader>dC",
	'<cmd>lua require"dap_setup".reload_continue()<CR>',
	{ desc = "DAP Reload Cont." }
)

return M
