-- Custom keymap that mirrors "dw" normal-mode delete word in Cmdline mode
-- Keymap deletes from current cursor, to the end of current word (non-alphanumeric char)
-- Deleted text is stored in Register 'z' for reuse, if needed

vim.keymap.set("c", "<A-f>", function()
	local cmdline_curr = vim.fn.getcmdline()
	local pos = vim.fn.getcmdpos()
	print("cmdline: " .. cmdline_curr)
	print("pos indx: " .. pos)

	-- markers for cutting
	local before = cmdline_curr:sub(1, pos - 1)
	local after = cmdline_curr:sub(pos)

	local delete_len = after:find("[^0-z]") or (#after + 1)
	local cut_text = after:sub(1, delete_len - 1)
	local new_cmdline = before .. after:sub(delete_len)
	print("cut text: " .. cut_text)
	print("new cmdline: " .. new_cmdline)

	-- save deleted text to register 'z'
	-- reuse in Cmdline mode with `<C-r>z`
	vim.fn.setreg("z", cut_text)

	-- update cmdline after cut
	vim.fn.setcmdline(new_cmdline)

	-- move cursor to where deleted text ends
	vim.fn.setcmdpos(pos)
end, { noremap = true, desc = "Cmdline - delete to end of current word" })
