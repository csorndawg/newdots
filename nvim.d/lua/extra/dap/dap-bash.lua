local dap = require("dap")

dap.adapters.bashdb = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
	name = "bashdb",
}

dap.configurations.sh = {
	{
		type = "bashdb",
		request = "launch",
		name = "Launch file",
		showDebugOutput = true,
		pathBash = "/bin/bash",
		program = "${file}",
		cwd = "${workspaceFolder}",
		terminalKind = "integrated",
	},
}
