-- Python specific DAP configurations
local dap_py = require("dap-python")

-- set UV default VENV as python interpreter
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local venv_path = vim.fn.expand(mason_path .. "packages/debugpy/venv/bin/python")
dap_py.setup(venv_path)

-- setup testing
require("neotest").setup({
	adapters = {
		require("neotest-python")({
			-- Extra arguments for nvim-dap configuration

			-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
			dap = {
				justMyCode = false,
				console = "integratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})

vim.keymap.set("n", "dm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Neotest Test Method" })
vim.keymap.set(
	"n",
	"dM",
	"<cmd>lua require('neotest').run.run(strategy = 'dap')<cr>",
	{ desc = "Neotest Test Method DAP" }
)
vim.keymap.set(
	"n",
	"df",
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
	{ desc = "Neotest Test Class" }
)
vim.keymap.set(
	"n",
	"dF",
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
	{ desc = "Neotest Test Class DAP" }
)
vim.keymap.set("n", "dS", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Neotest Test Summary" })
