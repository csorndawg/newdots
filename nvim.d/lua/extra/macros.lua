-- Default macro behavior is being overwritten somewhere in my config by an
-- external plugin. This file is to fix/revert this, so it has default behavior.

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		local reg = vim.fn.reg_recording()
		vim.notify("Recording macro @" .. reg, vim.log.levels.INFO, { title = "Macro" })
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		vim.notify("Stopped recording macro", vim.log.levels.INFO, { title = "Macro" })
	end,
})
