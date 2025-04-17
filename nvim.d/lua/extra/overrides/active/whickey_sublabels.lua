-- another stab at this sublabel config after reviewing docs
local wk = require("which-key")

-- Use the supported table format for group labels (still valid and preferred)
wk.register({
	x = { name = "e[X]perimental" },
	m = { name = "[M]iscellaneous" },
	t = { name = "[t]elescope builtins" },
	T = { name = "[T]elescope extensions" },
}, { prefix = "<leader>" })

-- mock keymaps just to test whichkey map behavior
vim.keymap.set("n", "<leader>xx", "<cmd>echo 'Experimental Feature'<cr>", { desc = "Experimental Feature" })
vim.keymap.set("n", "<leader>mm", "<cmd>echo 'Misc Function'<cr>", { desc = "Misc Function" })
vim.keymap.set("n", "<leader>tt", "<cmd>Telescope builtin<cr>", { desc = "Telescope Builtins" })
vim.keymap.set("n", "<leader>Tl", "<cmd>Telescope luasnip<cr>", { desc = "Telescope Luasnip" })
