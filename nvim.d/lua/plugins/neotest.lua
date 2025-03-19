return {
	"nvim-neotest/neotest",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-bash", -- future adapter ex.
		"nvim-neotest/neotest-python",
		"nvim-neotest/nvim-nio",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		local adapters = {}

		-- Load Python adapter
		local neotest_python = require("extra.dap.neotest_python").setup()
		if neotest_python then
			table.insert(adapters, neotest_python)
		end

		-- You can add more adapters like neotest-bash here in the future

		return {
			adapters = adapters,
		}
	end,
}
