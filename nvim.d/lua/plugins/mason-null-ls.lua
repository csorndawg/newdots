return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"ruff", -- Python linter
				"hadolint", -- Docker linter
				"yamlfmt", -- YAML linter
				"commitlint", -- Git commit linter
				"write-good", -- Markdown/Text linter
				"shellcheck", -- Shell linter
				"black", -- Python formatter
				"shfmt", -- Shell formatter
				"yamlfix", -- YAML formatter
			},
			automatic_installation = true,
		})
	end,
}
