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
	{ "<leader>o", group = "Obsidian" },

	-- Git
	{ "<leader>g", group = "Git" },

	-- Git diff subkey
	{ "<leader>gd", group = "Git [d]iff" },

	-- Git hunk subkey
	{ "<leader>gh", group = "Hunk navigation" },

	-- Mini
	{ "<leader>m", group = "Mini" },
	{ "<leader>ms", group = "[S]urround" },
	{ "<leader>mc", group = "[C]omment" },
	{ "<leader>ma", group = "[A]i" },

	-- LSP
	{ "<leader>l", group = "LSP" },

	-- Buffers
	{ "<leader>b", group = "Buffers" },

	-- Visual
	{ "<leader>v", group = "Visual Mode" },

	-- Trouble
	{ "<leader>t", group = "Trouble" },
})
