local dap = require("dap")

dap.adapters.python = {
	type = "executable",
	command = vim.fn.exepath("python"),
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return vim.fn.exepath("python")
		end,
	},
}
