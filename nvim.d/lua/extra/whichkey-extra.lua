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

	-- telescope sublabels
	{ "<leader>tv", group = "[V]im Pickers" },
	{ "<leader>tg", group = "[G]it Pickers" },

	-- @TODO: Move debug 'desc' to corresponding remapping in dap-extras
	-- DAP [d]ebug keymap group
	{ "<leader>d", group = "[D]ebug" },
	-- { "<leader>db ", desc = "Toggle Breakpoint" },
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
	{ "<leader>o", group = "[O]bsidian" },

	-- Git
	{ "<leader>g", group = "[G]it" },

	-- Git diff subkey
	{ "<leader>gd", group = "Git [d]iff" },

	-- Git hunk subkey
	{ "<leader>gh", group = "Hunk navigation" },

	-- Mini
	-- { "<leader>ma", group = "[A]i" },

	-- LSP
	-- { "<leader>l", group = "[L]SP" },

	-- Buffers
	{ "<leader>b", group = "[B]uffers" },

	-- Visual
	{ "<leader>v", group = "Visual Mode" },

	-- Whichkey
	{ "<leader>w", group = "Whichkey (Meta)" },

	-- Aerial
	{ "<leader>a", group = "Aerial" },

	-- Trouble
	-- { "<leader>T", group = "[T]rouble" },
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

-- comment toggling convenience mapping
-- normal mode comment toggling
vim.keymap.set("n", "<leader><leader>c", function()
	local count = vim.v.count
	local start_line = vim.fn.line(".")
	local end_line = start_line + (count > 0 and count or 1) - 1
	if end_line < start_line then
		end_line = start_line
	end
	vim.cmd(string.format("%d,%dnormal gcc", start_line, end_line))
end, { desc = "Toggle comment (count-aware)", silent = true })

-- visual mode toggle comment
vim.keymap.set("v", "<leader><leader>c", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)" })

-- delete next character and remain in INSERT
vim.keymap.set("i", "<A-x>", "<Esc>xi", { silent = true, noremap = true })

vim.keymap.set(
	"n",
	"<leader><leader>W",
	":wa!",
	{ desc = "Write all buffers (forcibly)", silent = true, noremap = true }
)
vim.keymap.set(
	"n",
	"<leader><leader>X",
	":qa!",
	{ desc = "EXit all buffers (forcibly) ", silent = true, noremap = true }
)
