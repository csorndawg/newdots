local M = {}

M.setup = function()
	local ok, neotest_python = pcall(require, "neotest-python")
	if not ok then
		return {}
	end

	return neotest_python({
		dap = { justMyCode = false }, -- Enable debugging
		python = vim.g.python3_host_prog,
	})
end

return M
