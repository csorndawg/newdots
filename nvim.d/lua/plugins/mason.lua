-- Install Mason plugin + all predefined Mason (LSP/Linters/Formatters/DAP debuggers) installs
--
-- -- source all predefined "Mason" installs
-- local mason_tools = require("extra.mason.mason")
--
-- -- install mason
-- require("mason").setup()
--
-- -- install LSP servers
-- require("mason-lspconfig").setup({
--   ensure_installed = mason_tools.lsp,
--   automatic_installation = true,
-- })
--
-- -- install formatters/linters
-- require("mason-null-ls").setup({
--   ensure_installed = mason_tools.null_ls,
--   automatic_installation = true,
-- })
--
-- -- install DAP debuggers
-- require("mason-nvim-dap").setup({
--   ensure_installed = mason_tools.dap,
--   automatic_installation = true,
-- })
--

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- event = "VeryLazy",
		config = function()
			local mason_tools = require("extra.mason.mason")
			local all_tools = {}
			vim.list_extend(all_tools, mason_tools.lsp)
			vim.list_extend(all_tools, mason_tools.null_ls)
			vim.list_extend(all_tools, mason_tools.dap)

			require("mason-tool-installer").setup({
				ensure_installed = all_tools,
				auto_update = false,
				run_on_start = true,
				start_delay = 3000, -- ms
				debounce_hours = 5,
			})
		end,
	},
}
