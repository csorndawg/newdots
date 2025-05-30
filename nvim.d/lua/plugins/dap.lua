-- Install DAP/DAP-related plugins. Plugin configuration set in extra/dap/<module>.lua

return {
	{ "mfussenegger/nvim-dap" },
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-dap" },
		config = function()
			require("extra.dap.nvim-dap-ui")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function()
			require("extra.dap.nvim-dap-python")
		end,
	},
	{
		"rcarriga/cmp-dap",
		config = function()
			require("extra.dap.cmp-dap")
		end,
	},
}
