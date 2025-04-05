-- Which-Key Mappings Extended/Customized
--
-- Certain functionality has dedicated subgroup key (eg. telescope w/ 't')
-- 'z' subgroup key is a catch-all for miscellaneous/utilities

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
	-- Telescope [s]earch keymap group
	{ "<leader>t", group = "[T]elescope Search" }, -- telescope [s]earch group

	-- Telescope [L]sp subgroup keymap
	{ "<leader>tl", group = "[L]SP Pickers" },
	{ "<leader>tv", group = "[V]im Pickers" },
	{ "<leader>tg", group = "[G]it Pickers" },
	{ "<leader>tn", desc = "Telescope find Nvim files" },

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

	-- @TODO: Add "nested" keymaps For each of the group labels below
	-- Obsidian
	{ "<leader>o", group = "[O]bsidian" },

	-- Git
	{ "<leader>g", group = "[G]it" },

	-- Git diff subkey
	{ "<leader>gd", group = "Git [d]iff" },

	-- Git hunk subkey
	{ "<leader>gh", group = "Git [h]unks" },

	-- Mini
	-- { "<leader>ma", group = "[A]i" },

	-- LSP
	{ "<leader>l", group = "[L]SP" },

	-- Buffers
	{ "<leader>b", group = "[B]uffers" },

	-- Visual
	{ "<leader>v", group = "Visual Mode" },

	-- Trouble
	{ "<leader>T", group = "[T]rouble" },
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
