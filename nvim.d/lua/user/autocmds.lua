-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- source: lazyVim
-- disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- toggle autoformatting enablement
require("conform").setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

-- Disable/Enable Autoformatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- disable automatic next line comment if current line comment
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- have ".rc" files treated as "bash" filetypes
vim.api.nvim_create_augroup("FileTypeRC", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "rc", "comp" },
	command = "set filetype=bash",
	group = "FileTypeRC",
})
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "rc", "comp" },
	command = "set filetype=bash",
	group = "FileTypeRC",
})

-- set filetypes for custom ignore ft extensions (.gig, .ignore)
vim.api.nvim_create_augroup("FileTypeIGNR", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "gig", "ignore" },
	command = "set filetype=text",
	group = "FileTypeIGNR",
})
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "gig", "ignore" },
	command = "set filetype=text",
	group = "FileTypeIGNR",
})

-- print message if any Mason updates occur
vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function(e)
		if e.data and vim.tbl_isempty(e.data) then
			vim.schedule(function()
				print("No Mason updates were performed.")
			end)
		end
	end,
})

-- Ensure :help always opens in a vertical split on the right
vim.cmd([[
  command! -nargs=* Help vertical rightbelow help <args>
]])

-- Autocmd to move help buffers to the right side and resize
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.txt",
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd("wincmd L") -- Move help window to the far right
			vim.cmd("vertical resize 80") -- Adjust width (optional)
		end
	end,
})
