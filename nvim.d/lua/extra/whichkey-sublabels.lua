-- another stab at this sublabel config after reviewing docs
local wk = require("which-key")

-- Use the supported table format for group labels (still valid and preferred)
wk.register({
	-- x = { name = "e[X]perimental" },
	-- Dedicated subkey space for testing/validating interim keymaps before updating for my use case
	-- Subkey space is intentionally inconvient to avoid namespace conflicts with actual mappings
	Z9 = { name = "Experimental/Overrides/Testing" },
	ZZ = { name = "Reserving for dummy keylabel spillover" },
	-- z = { name = "Dummy Subkey Labels" },
	m = { name = "[M]iscellaneous" },
	t = { name = "[t]elescope builtins" },
	T = { name = "[T]elescope extensions" },
	Q = { name = "[Q]uickfix" },
	c = { name = "[C]ode Actions" },
	cm = { name = "[M]agma" },
	cl = { name = "[L]int" },
	cv = { name = "[V]env" },
	l = { name = "[L]SP" },
	lL = { name = "Lsp 2" },
	S = { name = "[S]nacks" }, -- keep on 'S' for now, but might move to 's'
}, { prefix = "<leader>" })

-- mock keymaps just to test whichkey map behavior
-- vim.keymap.set("n", "<leader>xx", "<cmd>echo 'Experimental Feature'<cr>", { desc = "Experimental Feature" })
vim.keymap.set("n", "<leader>mm", "<cmd>echo 'Misc Function'<cr>", { desc = "Misc Function" })
vim.keymap.set("n", "<leader>clz", "<cmd>echo 'Test LSP Lint subkey'<cr>", { desc = "Code Actions - Venv Function" })
vim.keymap.set("n", "<leader>ta", "<cmd>Telescope builtin<cr>", { desc = "All builtins search" })
vim.keymap.set("n", "<leader>Tl", "<cmd>Telescope luasnip<cr>", { desc = "Telescope Luasnip" })
vim.keymap.set(
	"n",
	"<leader>ZZe",
	"<cmd>echo 'ZZ is reservered keylabel, incase <Leader>Z runs out of mapping space.'",
	{ desc = "ZZ Sublabel Description" }
)
vim.keymap.set(
	"n",
	"<leader>Z9e",
	"<cmd>echo 'Z9 subkey is used solely for testing, and the real whichkey mapping will be defined after validation.'",
	{ desc = "Subkey Description" }
)
vim.keymap.set(
	"n",
	"<leader>cmz",
	"<cmd>echo 'Magma Subkey Label Test'<cr>",
	{ desc = "Dummy Magma Subkey Keymap Actions" }
)

-- @Experimental: Assigning dummy subkey label to "<Leader>z" for keymaps that don't begin with <leader>.
local wk = require("which-key")

wk.register({
	Z = {
		name = "Dummy Subkey Label",
		["sa"] = "Add surrounding: <sa>",
		["sd"] = "Delete surrounding: <sd>",
		["sr"] = "Replace surrounding: <sr>",
		["sf"] = "Find next (right) surrounding: <sf>",
		["sF"] = "Find prev (left) surrounding: <sF>",
		["sh"] = "Highlight surrounding: <sh>",
		["sn"] = "Change number of neighbor lines: <sn>",
		["1"] = "Next buffer: <Ctrl-Right> or <Ctrl-.>",
		["2"] = "Next buffer: <Ctrl-Left> or <Ctrl-,>",
		["3"] = "Resize split up: <Shift-Up>",
		["4"] = "Resize split down: <Shift-Down>",
		["5"] = "Resize split left: <Shift-Left>",
		["6"] = "Resize split right: <Shift-Right>",
		["a"] = "Echo Path: <Leader>ep",
	},
}, { prefix = "<leader>" })
