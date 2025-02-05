return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- LSP support
		"jay-babu/mason-null-ls.nvim", -- Linters & Formatters
		"jay-babu/mason-nvim-dap.nvim", -- Debuggers
	},
	config = function()
		require("mason").setup()

		-- Ensure LSP servers are installed
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ansiblels",
				"bashls", -- Bash
				"docker_compose_language_service",
				"dockerls",
				--"gopls", -- Go
				"lua_ls", -- Lua
				"pyright", -- Python
				"taplo",
				"yamlls", -- YAML
			},
			automatic_installation = true,
		})

		-- Ensure formatters & linters are installed
		require("mason-null-ls").setup({
			ensure_installed = {
				"ansible-lint",
				"black", -- Python formatter
				"hadolint", -- Docker linter
				"ruff", -- Python linter
				"selene", -- Lua Linter
				"stylua", -- Lua formatter
				"shellcheck", -- Bash linter
				"shfmt", -- Bash Formatter
				"sqlruff",
				"stylua", -- Lua formatter
				"write-good",
				"jq",
				"yamllint",
				"yamlfix",
			},
			automatic_installation = true,
		})

		-- Ensure DAP (Debug Adapters) are installed
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"debugpy",
				"bash-debug-adapter",
				--"delve", -- Go debugger
			},
			automatic_installation = true,
		})
	end,
}
