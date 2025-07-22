-- snacks keymaps
local Snacks = require("snacks")

-- ----------------------------------------
-- Snacks.Picker Keymaps
-- ----------------------------------------

-- search for match within current file
vim.keymap.set("n", "<leader>Sl", function()
	Snacks.picker.lines()
end, { noremap = true, desc = "Pick buffer lines" })

-- search for pattern match across all open buffers
vim.keymap.set("n", "<leader>SB", function()
	Snacks.picker.grep_buffers()
end, { noremap = true, desc = "Grep open buffers" })

vim.keymap.set("n", "<leader>Sg", function()
	Snacks.picker.grep()
end, { noremap = true, desc = "Grep (current location)" })

-- search for current visual selection pattern or current word under cursor across all files
vim.keymap.set({ "n", "v", "x" }, "<leader>Sw", function()
	Snacks.picker.grep_word()
end, { desc = "Grep visual selection or word", noremap = true })

-- pick registers
vim.keymap.set("n", '<leader>Sr"', function()
	Snacks.picker.registers()
end, { noremap = true, desc = "Pick register" })

-- search nvim-search history
vim.keymap.set("n", "<leader>S/", function()
	Snacks.picker.search_history()
end, { noremap = true, desc = "Search history" })

-- search/pick open buffer names
vim.keymap.set("n", "<leader>Sb", function()
	Snacks.picker.buffers()
end, { noremap = true, desc = "Pick buffers" })

-- search nvim-cmd mode Cmdline history
vim.keymap.set("n", "<leader>S:", function()
	Snacks.picker.command_history()
end, { noremap = true, desc = "Cmd History" })

-- search nvim notification logs
vim.keymap.set("n", "<leader>Sn", function()
	Snacks.picker.notifications()
end, { noremap = true, desc = "Notification History" })

-- search/pick recent files
vim.keymap.set("n", "<leader>Sf", function()
	Snacks.picker.recent()
end, { noremap = true, desc = "Recent Files" })

-- search/pick config file
vim.keymap.set("n", "<leader>SF", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File", noremap = true })

-- Git Pickers
vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_files()
end, { noremap = true, desc = "Find Git Files" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { noremap = true, desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { noremap = true, desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { noremap = true, desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gF", function()
	Snacks.picker.git_log_file()
end, { noremap = true, desc = "Git Log File" })

-- Search-and-Pick
vim.keymap.set("n", "<leader>Sa", function()
	Snacks.picker.autocmds()
end, { noremap = true, desc = "Autocmds" })
vim.keymap.set("n", "<leader>SC", function()
	Snacks.picker.commands()
end, { noremap = true, desc = "Commands" })
vim.keymap.set("n", "<leader>Sh", function()
	Snacks.picker.help()
end, { noremap = true, desc = "Help Pages" })
vim.keymap.set("n", "<leader>Sj", function()
	Snacks.picker.jumps()
end, { noremap = true, desc = "Jumps" })
vim.keymap.set("n", "<leader>Sk", function()
	Snacks.picker.keymaps()
end, { noremap = true, desc = "Keymaps" })
vim.keymap.set("n", "<leader>Sm", function()
	Snacks.picker.marks()
end, { noremap = true, desc = "Marks" })
vim.keymap.set("n", "<leader>SM", function()
	Snacks.picker.man()
end, { noremap = true, desc = "Man Pages" })
vim.keymap.set("n", "<leader>Sq", function()
	Snacks.picker.qflist()
end, { noremap = true, desc = "Quickfix List" })
vim.keymap.set("n", "<leader>Su", function()
	Snacks.picker.undo()
end, { noremap = true, desc = "Undo History" })

-- ----------------------------------------
-- Snacks.Notify Keymaps
-- ----------------------------------------

-- snacks.notify() autocmd
vim.api.nvim_create_user_command("SnackNotify", function()
	require("snacks").notify.notify("Snack via :SnackNotify", "info")
end, {})

-- ----------------------------------------
-- Snacks.Notifier Keymaps
-- ----------------------------------------

-- ----------------------------------------
-- Snacks.Scratch Keymaps
-- ----------------------------------------

vim.keymap.set({ "x", "n" }, "<leader>So", function()
	Snacks.scratch.open()
end, { noremap = true, desc = "Open scratch buffer" })

vim.keymap.set({ "x", "n" }, "<leader>Ss", function()
	Snacks.scratch()
end, { noremap = true, desc = "Toggle scratch buffer" })

vim.keymap.set({ "x", "n" }, "<leader>SS", function()
	Snacks.scratch.select()
end, { noremap = true, desc = "Select scratch buffer" })

-- ----------------------------------------
-- Snacks.Lazygit Keymaps
-- ----------------------------------------

vim.keymap.set("n", "<leader>gz", function()
	Snacks.lazygit.open()
end, { noremap = true, desc = "LazyGit Open" })

vim.keymap.set("n", "<leader>gZ", function()
	Snacks.lazygit.log()
end, { noremap = true, desc = "LazyGit Log" })

-- ----------------------------------------
-- Snacks.Lazygit Keymaps
-- ----------------------------------------
