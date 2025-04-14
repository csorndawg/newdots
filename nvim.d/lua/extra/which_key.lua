-- Which-Key Post-Build Configuratio[C]ode (Lint/Format)

local wk = require("which-key")

--[[
    @TODO: Add/Remove/Update Which-Key Bindings List - includes keygroups and indv. keymaps

    -- Key Groups (see "Search" key group for ref.)
	Buffers: <leader>b
	Debug: <leader>d
	Trouble: <leader>t
	Git: <leader>g
	LSP: <leader>l

    -- Indvidual Bindings:
	<list here>
--]]

wk.add({

	-- @TODO: ADD all sub group (and any nested) labels here
	-- { "<leader>t", group = "Telescope Builtins" }, -- telescope [s]earch group
	-- { "<leader>T", group = "Telescope Extended" }, -- telescope [s]earch group
	-- { "<leader>g", group = "[G]it" },
	-- { "<leader>gd", group = "Git [d]iff" },
	-- { "<leader>l", group = "[L]SP" },
	-- { "<leader>T", group = "[T]rouble" },

	-- @WIP: Adding subkey/nested subkey groups in piecemeal
	{ "<leader>l", group = "[L]SP" },
	{ "<leader>o", group = "[O]bsidian" },
	{ "<leader>b", group = "[B]uffers" }, -- Buffers
	{ "<leader>v", group = "Visual Mode" }, -- Visual

	-- Two distinct subkey groups for Telescope mappings
	--  -- 't' for all builtin Telescope mappings
	--  -- 'T' for all non-default Telescope mappings (eg. extensions, custom pickers, etc.)

	-- Builtin Telescope WhichKeys Labels
	{ "<leader>t", group = "Telescope Builtins" }, -- telescope [s]earch group
	{ "<leader>tl", group = "[L]SP Pickers" },
	{ "<leader>tv", group = "[V]im Pickers" },
	{ "<leader>tg", group = "[G]it Pickers" },

	-- Extended Telescope WhichKeys Labels
	{ "<leader>T", group = "Telescope Extended" }, -- telescope [s]earch group

	-- @TODO: Move debug 'desc' to corresponding remapping in dap-extras
	-- DAP [d]ebug keymap group
	{ "<leader>d", group = "[D]ebug" },
	{ "<leader>db ", desc = "Toggle Breakpoint" },
	{ "<leader>dB", desc = "Set Breakpoint" },
	{ "<leader>dk ", desc = "Step Back" },
	{ "<leader>dc", desc = "Continue" },
	{ "<leader>dd", desc = "Disconnect" },
	{ "<leader>dg", desc = "Get Session" },
	{ "<leader>ds", desc = "Start" },
	{ "<leader>dp", desc = "Pause" },
	--{ "<leader>di ", desc = "Step Into" },
	--{ "<leader>do ", desc = "Step Out" },
	--{ "<leader>dC", desc = "Run To Cursor" },
	--{ "<leader>dU ", desc = "Toggle UI" },
	--{ "<leader>dq ", desc = "Quit" },
	--{ "<leader>dr ", desc = "Toggle Repl" },
	--{ "<leader>dt ", desc = "Toggle DAP-UI" },
	--{"<leader>dv ", desc = "Step Over" },
})

-- -- create 'ignore" (do not display in whichkey-menu) register
-- wk.register({
--   ["\\"] = {},  -- This hides all mappings starting with '\'
-- })

-- alt. mapping to view keymaps
vim.keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "view all whichkey keymaps" })
vim.keymap.set("n", "<leader>??", "<cmd>WhichKey <CR>", { desc = "view all whichkey keymaps" })

vim.keymap.set("n", "<leader>wq", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
