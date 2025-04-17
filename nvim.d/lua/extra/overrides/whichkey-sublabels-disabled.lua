-- @WIP: Untested whichkey mapping configurations. Move to extra/ after testing
local wk = require("which-key")

-- Register group labels (recommended format)
wk.register({
	{ "", "<leader>mm", desc = "<cmd>echo 'Misc Function'<cr>" },
	{ "", "<leader>Tl", desc = "<cmd>Telescope luasnip<cr>" },
	{ "", "<leader>tt", desc = "<cmd>Telescope builtin<cr>" },
	{ "", "<leader>xx", desc = "<cmd>echo 'Experimental Feature'<cr>" },
})

-- Register keymaps inside those groups (recommended format)
wk.register({
	{ "", group = "[t]elescope builtins" },
	{ "", group = "e[X]perimental" },
	{ "", group = "[T]elescope extensions" },
	{ "", group = "[M]iscellaneous" },
}) -- Suggested Spec:
