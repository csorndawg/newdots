-- snacks keymaps
local Snacks = require("snacks")

-- search for match within current file
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { noremap = true, desc = "Buffer Lines" })

-- search for pattern match across all open buffers
vim.keymap.set("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { noremap = true, desc = "Grep Open Buffers" })

vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { noremap = true, desc = "Grep" })

-- search for current visual selection pattern or current word under cursor across all files
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word", noremap = true })

-- search registers
vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { noremap = true, desc = "Registers" })

-- search search history
vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { noremap = true, desc = "Search History" })

-- search buffer names
vim.keymap.set("n", "<leader>,", function()
	Snacks.picker.buffers()
end, { noremap = true, desc = "Buffers" })

-- search nvim search mode patterns
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { noremap = true, desc = "Grep" })

-- search Cmdline history
vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { noremap = true, desc = "Command History" })

-- search nvim notification logs
vim.keymap.set("n", "<leader>sn", function()
	Snacks.picker.notifications()
end, { noremap = true, desc = "Notification History" })
-- vim.keymap.set("n", "<leader>fp", function()
-- Snacks.picker.projects()
-- end, { noremap = true, desc = "Projects" })
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.recent()
end, { noremap = true, desc = "Recent Files" })
