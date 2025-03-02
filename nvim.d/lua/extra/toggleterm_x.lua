local tterm = require("toggleterm")
-- local status_ok, toggleterm = pcall(require, "toggleterm")
-- if not status_ok then
-- 	return
-- end

tterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {

		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit Term" })
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], { noremap = true, desc = "Exit Term" })
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true, desc = "Term Left" })
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true, desc = "Term Down" })
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true, desc = "Term Up" })
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true, desc = "Term Right" })
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- -- function _LAZYGIT_TOGGLE()
-- -- 	lazygit:toggle()
-- -- end
-- --
-- -- local node = Terminal:new({ cmd = "node", hidden = true })
-- --
-- -- function _NODE_TOGGLE()
-- -- 	node:toggle()
-- -- end
-- --
-- -- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
-- --
-- -- function _NCDU_TOGGLE()
-- -- 	ncdu:toggle()
-- -- end
-- --
-- -- local htop = Terminal:new({ cmd = "htop", hidden = true })
-- --
-- -- function _HTOP_TOGGLE()
-- -- 	htop:toggle()
-- -- end
-- --
-- -- local python = Terminal:new({ cmd = "python", hidden = true })
-- --
-- -- function _PYTHON_TOGGLE()
-- -- 	python:toggle()
-- -- end
--
--
-- more examples
local trim_spaces = true

-- send single line
vim.keymap.set("v", "<space>tl", function()
	tterm.send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)

-- send entire selection block
vim.keymap.set("v", "<space>tb", function()
	tterm.send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
