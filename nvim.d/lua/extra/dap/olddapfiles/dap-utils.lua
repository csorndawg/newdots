local M = {}

function M.print_dap_capabilities()
	local dap = require("dap")
	local session = dap.session()
	if session and session.capabilities then
		print("✅ DAP session active. Capabilities:")
		print(vim.inspect(session.capabilities))
	else
		print("❌ No active DAP session.")
	end
end

vim.keymap.set("n", "<leader>dP", function()
	M.print_dap_capabilities()
end, { desc = "DAP: Show active session capabilities" })

vim.api.nvim_create_user_command("DapStatus", function()
	M.print_dap_capabilities()
end, {})

return M
