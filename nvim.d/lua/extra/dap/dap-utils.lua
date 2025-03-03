-- Source: https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#2-clear-the-lua-package-cache-and-reload-the-configuration-module

-- reload DAP configurations at runtime (otherwise cached at install time)
local M = {}
local dap = require("dap")

function M.reload_continue()
	package.loaded["dap_config"] = nil
	require("dap_config")
	dap.continue()
end

-- local opts = { noremap = false, silent = true }

-- <Leader>ec to continue
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<Leader>ec",
	'<cmd>lua require"dap".continue()<CR>',
	{ noremap = false, silent = true, desc = "Reload DAP config" }
)

-- <Leader>eC to reload and then continue
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<Leader>eC",
	'<cmd>lua require"dap_setup".reload_continue()<CR>',
	{ noremap = false, silent = true, desc = "Reload DAP config" }
)

-- runs current buffer as a script, with CLI args, then enters immediately into DEBUG mode
vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
	-- :help nvim_create_user_command
	args = vim.split(vim.fn.expand(t.args), "\n")
	approval = vim.fn.confirm(
		"Will try to run:\n    "
			.. vim.bo.filetype
			.. " "
			.. vim.fn.expand("%")
			.. " "
			.. t.args
			.. "\n\n"
			.. "Do you approve? ",
		"&Yes\n&No",
		1
	)
	if approval == 1 then
		dap.run({
			type = vim.bo.filetype,
			request = "launch",
			name = "Launch file with custom arguments (adhoc)",
			program = "${file}",
			args = args,
		})
	end
end, {
	complete = "file",
	nargs = "*",
})
-- vim.keymap.set("n", "<leader>R", ":RunScriptWithArgs ")
vim.keymap.set("n", "<leader>R", { desc = "RunScriptWithArgs", noremap = true })

return M
