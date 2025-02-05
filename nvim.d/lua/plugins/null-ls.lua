return {
	"nvimtools/none-ls.nvim",
	dependencies = { "jay-babu/mason-null-ls.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.black, -- Python
				--null_ls.builtins.formatting.prettier,    -- JS/TS, Markdown, JSON
				null_ls.builtins.formatting.shfmt, -- shell formatter
				null_ls.builtins.formatting.yamlfix, -- Lua
				null_ls.builtins.formatting.stylua, -- Lua
				null_ls.builtins.formatting.jq, -- JSON

				-- Linters
				null_ls.builtins.diagnostics.ansible_lint,
				null_ls.builtins.diagnostics.yamllint,
				null_ls.builtins.diagnostics.ruff, -- Python linter
				--null_ls.builtins.diagnostics.shellcheck,  @BROKEN: need to debug/fix null-ls error
				null_ls.builtins.diagnostics.write_good, -- Markdown
				null_ls.builtins.diagnostics.hadolint, -- Dockerfile

				-- @TODO: make if-statement that only does this if it exists in local /usr/bin otherwise use Mason shellcheck
				-- use APT installed shellcheck that exists on my system
				--				null_ls.builtins.diagnostics.shellcheck.with({
				--					command = "/usr/bin/shellcheck",
				--				}),
				--null_ls.builtins.diagnostics.selene,      -- Lua
			},
		})

		-- Run formatters on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
}
