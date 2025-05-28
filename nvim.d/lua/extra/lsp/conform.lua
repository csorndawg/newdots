-- @WIP
-- Keymaps to toggle formatting. Use below `lint.lua` remap example as reference.
--vim.api.nvim_set_keymap("n", "<leader>li", ":lua update_lint_level('info')<CR>", { noremap = true, silent = true })

--
require("conform")
vim.keymap.set("n", "<leader>fd", ":FormatDisable <CR>", { desc = "Disable formatting", noremap = true })
vim.keymap.set("n", "<leader>fe", "<cmd>FormatEnable<CR>", { desc = "Enable formatting", noremap = true })

-- @TODO: Experiment with keymaps for additional Conform API functionality

-- <conform>.format
-- <conform>.list_formatters
-- <conform>.format
-- <conform>.format
--
-- -- Toggle formatting autocmd
-- require("conform").setup({
-- 	format_on_save = function(bufnr)
-- 		-- Disable with a global or buffer-local variable
-- 		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
-- 			return
-- 		end
-- 		return { timeout_ms = 500, lsp_format = "fallback" }
-- 	end,
-- })
--
-- vim.api.nvim_create_user_command("FormatDisable", function(args)
-- 	if args.bang then
-- 		-- FormatDisable! will disable formatting just for this buffer
-- 		vim.b.disable_autoformat = true
-- 	else
-- 		vim.g.disable_autoformat = true
-- 	end
-- end, {
-- 	desc = "Disable autoformat-on-save",
-- 	bang = true,
-- })
-- vim.api.nvim_create_user_command("FormatEnable", function()
-- 	vim.b.disable_autoformat = false
-- 	vim.g.disable_autoformat = false
-- end, {
-- 	desc = "Re-enable autoformat-on-save",
-- })
--

-- format Visual selection then leave Visual mode (will remain in Visual after format by default)
vim.keymap.set("", "<leader>fv", function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
end, { desc = "Format visual selection code" })
