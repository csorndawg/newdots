-- Which-Key Post-Build Configuratio[C]ode (Lint/Format)

local wk = require("which-key")

wk.add({

	-- @INFO: Whichkey Group/Subgroup Labels
	-- -- only list labels, not actual keybindings themselves (save that for vim.keymap.set())

	-- Telescope [s]earch keymap group
	{ "<leader>s", group = "Search" }, -- telescope [s]earch group
	{ "<leader>sn", desc = "Telescope find Nvim files" },
	--{ "<leader>sl", desc = "Telescope livegrep" },
	--{ "<leader>sm", desc = "Telescope multigrep" },

	-- Telescope [L]sp subgroup keymap
	{ "<leader>sl", group = "[L]SP Pickers" },
	{ "<leader>sv", group = "[V]im Pickers" },
	{ "<leader>sg", group = "[G]it Pickers" },

	-- @TODO: Move debug 'desc' to corresponding remapping in dap-extras
	-- DAP [d]ebug keymap group
	{ "<leader>d", group = "Debug" },
	{ "<leader>db ", desc = "Toggle Breakpoint" },
	-- { "<leader>dB", desc = "Set Breakpoint" },
	-- { "<leader>dk ", desc = "Step Back" },
	-- { "<leader>dc", desc = "Continue" },
	-- { "<leader>dd", desc = "Disconnect" },
	-- { "<leader>dg", desc = "Get Session" },
	-- { "<leader>ds", desc = "Start" },
	-- { "<leader>dp", desc = "Pause" },
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
	{ "<leader>o", group = "Obsidian" },

	-- Git
	{ "<leader>g", group = "Git" },

	-- Git diff subkey
	{ "<leader>gd", group = "Git [d]iff" },

	-- Git hunk subkey
	{ "<leader>gh", group = "Hunk navigation" },

	-- Mini
	-- { "<leader>M", group = "Mini" },
	-- { "<leader>Ms", group = "[S]urround" },
	-- { "<leader>Mc", group = "[C]omment" },
	-- { "<leader>Ma", group = "[A]i" },

	-- LSP
	{ "<leader>l", group = "LSP" },

	-- Buffers
	{ "<leader>b", group = "Buffers" },

	-- Visual
	{ "<leader>v", group = "Visual Mode" },

	-- Trouble
	{ "<leader>T", group = "Trouble" },

	-- @INFO: Disable Keymaps Section
	-- -- Hide keymaps specified below cfrom WhichKey map (keymap still exists, just wont appear )
	--

	{ "<leader>h", hidden = true }, -- hide this keymap
	{ "<leader>j", hidden = true }, -- hide this keymap
	{ "<leader>k", hidden = true }, -- hide this keymap
	{ "<leader>l", hidden = true }, -- hide this keymap
	{ "<leader>w", hidden = true }, -- hide this keymap
	{ "<leader>W", hidden = true }, -- hide this keymap
	{ "<leader>u", hidden = true }, -- hide this keymap
	{ "<leader>q", hidden = true }, -- hide this keymap
	{ "<leader>Q", hidden = true }, -- hide this keymap
	{ "<leader>m", hidden = true }, -- hide this keymap
})

-- -- create 'ignore" (do not display in whichkey-menu) register
-- wk.register({
--   ["\\"] = {},  -- This hides all mappings starting with '\'
-- })

-- alt. mapping to view keymaps
vim.keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "view all whichkey keymaps" })

vim.keymap.set("n", "<leader>wq", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
