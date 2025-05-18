-- another stab at this sublabel config after reviewing docs
local wk = require("which-key")

-- Use the supported table format for group labels (still valid and preferred)
wk.register({
	x = { name = "e[X]perimental" },
	-- Dedicated subkey space for testing/validating interim keymaps before updating for my use case
	-- Subkey space is intentionally inconvient to avoid namespace conflicts with actual mappings
	z9 = { name = "Nonprod Testing/Validating Space" },
	m = { name = "[M]iscellaneous" },
	t = { name = "[t]elescope builtins" },
	T = { name = "[T]elescope extensions" },
	q = { name = "[q]uickfix" },
	c = { name = "[C]ode Actions" },
	-- l = { name = "[L]SP" },
	l = { name = "LSP" },
	lL = { name = "Lsp 2" },
	S = { name = "[S]nacks" }, -- keep on 'S' for now, but might move to 's'
	cl = { name = "[L]int" },
	cv = { name = "[V]env" },
}, { prefix = "<leader>" })

-- @VALIDATED: validated all 4 keymaps work as intended
-- mock keymaps just to test whichkey map behavior
vim.keymap.set("n", "<leader>xx", "<cmd>echo 'Experimental Feature'<cr>", { desc = "Experimental Feature" })
vim.keymap.set("n", "<leader>mm", "<cmd>echo 'Misc Function'<cr>", { desc = "Misc Function" })
vim.keymap.set("n", "<leader>clz", "<cmd>echo 'Test LSP Lint subkey'<cr>", { desc = "Code Actions - Venv Function" })
vim.keymap.set("n", "<leader>ta", "<cmd>Telescope builtin<cr>", { desc = "All builtins search" })
vim.keymap.set("n", "<leader>Tl", "<cmd>Telescope luasnip<cr>", { desc = "Telescope Luasnip" })
vim.keymap.set(
	"n",
	"<leader>z9e",
	"<cmd>echo 'This subkey is for testing/validating TEMPORARY keymaps that will be updated before released to PROD.'<cr>",
	{ desc = "Subkey Description" }
)
