-- Which-Key Post-Build Configuration

local wk = require("which-key")

wk.add({
	-- Telescope [s]earch keymap group
	{ "<leader>s", group = "Search" }, -- telescope [s]earch group
	{ "<leader>sn", desc = "Telescope find Nvim files" },
	{ "<leader>sl", desc = "Telescope livegrep" },
	{ "<leader>sg", desc = "Telescope multigrep" },

	-- DAP [d]ebug keymap group
	{ "<leader>d", group = "Debug" },
	{ "<leader>db ", "Step Back" },
	{ "<leader>di ", "Step Into" },
	{ "<leader>do ", "Step Over" },
	{ "<leader>dq ", "Quit" },
	{ "<leader>dr ", "Toggle Repl" },
	{ "<leader>dt ", "Toggle Breakpoint" },
	{ "<leader>du ", "Step Out" },
	{ "<leader>dU ", "Toggle UI" },
	{ "<leader>dC", "Run To Cursor" },
	{ "<leader>dc", "Continue" },
	{ "<leader>dd", "Disconnect" },
	{ "<leader>dg", "Get Session" },
	{ "<leader>dp", "Pause" },
	{ "<leader>ds", "Start" },

	-- @TODO: Add "nested" keymaps For each of the group labels below
	-- Obsidian
	{ "<leader>o", group = "Obsidian" },

	-- Git
	{ "<leader>g", group = "Git" },

	-- LSP
	{ "<leader>l", group = "LSP" },

	-- Buffers
	{ "<leader>b", group = "Buffers" },
})
