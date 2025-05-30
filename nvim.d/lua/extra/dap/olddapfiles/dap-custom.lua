-- Source: https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#2-clear-the-lua-package-cache-and-reload-the-configuration-module

local M = {}
local dap = require("dap")

function M.reload_continue()
	package.loaded["dap_config"] = nil
	require("dap_config")
	dap.continue()
end

local opts = { noremap = false, silent = true }

-- <Leader>eC to reload and then continue
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<Leader>dC",
	'<cmd>lua require"dap_config".reload_continue()<CR>',
	{ desc = "DAP Reload Cont." }
)

vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
	-- Check if the filetype is Python or Bash
	local allowed_filetypes = { python = true, sh = true, bash = true }
	if not allowed_filetypes[vim.bo.filetype] then
		vim.notify("RunScriptWithArgs is only available for Python or Bash files.", vim.log.levels.WARN)
		return
	end

	-- Split the arguments provided
	local args = vim.split(vim.fn.expand(t.args), "\n")

	-- Confirm execution
	local approval = vim.fn.confirm(
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

vim.keymap.set("n", "<leader>R", ":RunScriptWithArgs ", { desc = "Run Script w/ CLI args" })

return M
