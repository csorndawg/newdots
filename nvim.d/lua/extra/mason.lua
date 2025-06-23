-- Define LSP servers, DAP debuggers, linters, and formatters for Mason to install
--
-- After updating any of the tables below run `:MasonToolsUpdate` in Cmd-mode to sync changes
-- To list all available tool names run: `:lua require("mason-registry").get_all_package_names()`
--

local linters = {
	"ansible-lint",
	"commitlint",
	"editorconfig-checker",
	"hadolint",
	"ruff",
	"selene",
	"shellcheck",
	"sqlfluff",
	"vint",
	"write-good",
	"yamllint",
	"cpplint",
	"kube-linter",
	"postgrestools",
	"tombi",
}

local formatters = {
	"ast-grep",
	"black",
	"jq",
	"pgformatter",
	"ruff",
	"shfmt",
	"sqlfmt",
	"sqruff",
	"stylua",
	"superhtml",
	"tombi",
	"xmlformatter",
	"yamlfmt",
}

local null_ls = {}
vim.list_extend(null_ls, linters)
vim.list_extend(null_ls, formatters)

-- LSP servers (Mason LSP format)
local lsp = {
	"ansible-language-server",
	"awk-language-server",
	"bash-language-server",
	"dockerfile-language-server",
	"docker-compose-language-service",
	"jinja-lsp",
	"json-lsp",
	"lua-language-server",
	"pyright",
	"sqls",
	"taplo",
	-- "tree-sitter-query-language-server",   -- not listed in Mason registry, can only be installed via lspconfig
	"vim-language-server",
	"yaml-language-server",
	"marksman",
	"diagnostic-languageserver",
	"terraform-ls",
	"just-lsp",
	"yaml-language-server",
	"pyright",
	"ruff-lsp",
	"powershell-editor-services",
	-- "jqls", -- if supported in future
}

local debuggers = {
	"debugpy",
	"bash-debug-adapter",
	"local-lua-debugger-vscode",
	"cpptools",
	"netcoredbg",
}

return {
	lsp = lsp,
	dap = debuggers,
	null_ls = null_ls,
	linters = linters,
	formatters = formatters,
}
