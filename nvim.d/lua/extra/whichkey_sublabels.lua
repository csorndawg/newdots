-- another stab at this sublabel config after reviewing docs
local wk = require("which-key")

-- Use the supported table format for group labels (still valid and preferred)
wk.register({
	x = { name = "e[X]perimental" },
	-- Dedicated subkey space for testing/validating interim keymaps before updating for my use case
	-- Subkey space is intentionally inconvient to avoid namespace conflicts with actual mappings
	z9 = { name = "Experimental/Overrides/Testing" },
	-- z = { name = "Dummy Subkey Labels" },
	m = { name = "[M]iscellaneous" },
	t = { name = "[t]elescope builtins" },
	T = { name = "[T]elescope extensions" },
	q = { name = "[q]uickfix" },
	c = { name = "[C]ode Actions" },
	-- l = { name = "[L]SP" },
	l = { name = "[L]SP" },
	lL = { name = "Lsp 2" },
	s = { name = "[s]nacks" }, -- keep on 'S' for now, but might move to 's'
	cl = { name = "[L]int" },
	cv = { name = "[V]env" },
}, { prefix = "<leader>" })

-- @TODO: Review code to migrate above code to the cleaner/newer syntax below
-- Suggested Spec:
-- {
--   { "<leader>S", group = "[S]nacks" },
--   { "<leader>T", group = "[T]elescope extensions" },
--   { "<leader>c", group = "[C]ode Actions" },
--   { "<leader>cl", group = "[L]int" },
--   { "<leader>cv", group = "[V]env" },
--   { "<leader>l", group = "LSP" },
--   { "<leader>lL", group = "Lsp 2" },
--   { "<leader>m", group = "[M]iscellaneous" },
--   { "<leader>q", group = "[q]uickfix" },
--   { "<leader>t", group = "[t]elescope builtins" },
--   { "<leader>x", group = "e[X]perimental" },
--   { "<leader>z9", group = "Nonprod Testing/Validating Space" },
-- }
-- mock keymaps just to test whichkey map behavior
vim.keymap.set("n", "<leader>xx", "<cmd>echo 'Experimental Feature'<cr>", { desc = "Experimental Feature" })
vim.keymap.set("n", "<leader>mm", "<cmd>echo 'Misc Function'<cr>", { desc = "Misc Function" })
vim.keymap.set("n", "<leader>clz", "<cmd>echo 'Test LSP Lint subkey'<cr>", { desc = "Code Actions - Venv Function" })
vim.keymap.set("n", "<leader>ta", "<cmd>Telescope builtin<cr>", { desc = "All builtins search" })
vim.keymap.set("n", "<leader>Tl", "<cmd>Telescope luasnip<cr>", { desc = "Telescope Luasnip" })
vim.keymap.set(
	"n",
	"<leader>z9e",
	"<cmd>echo 'z9 subkey is used solely for testing, and the real whichkey mapping will be defined after validation.",
	{ desc = "Subkey Description" }
)

-- @Experimental: Assigning dummy subkey label to "<Leader>z" for keymaps that don't begin with <leader>.
local wk = require("which-key")

wk.register({
	z = {
		name = "Dummy Subkey Label",
		["sa"] = "Add surrounding",
		["sd"] = "Delete surrounding",
		["sr"] = "Replace surrounding",
		["sf"] = "Find next (right) surrounding",
		["sF"] = "Find prev (left) surrounding",
		["<C-Right>"] = "Next buffer: <Ctrl-Right>",
		["<C-Left>"] = "Prev buffer: <Ctrl-Left>",
		["<S-Up>"] = "Resize split upwards: <Shift-Up>",
		["<S-Down>"] = "Resize split downwards: <Shift-Down>",
		["<S-Left>"] = "Resize split leftwards: <Shift-Left>",
		["<S-Right>"] = "Resize split rightwards: <Shift-Right>",
	},
}, { prefix = "<leader>" })
