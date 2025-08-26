-- Define LSP servers, DAP debuggers, linters, and formatters for Mason to install
--
-- After updating any of the tables below run `:MasonToolsUpdate` in Cmd-mode to sync changes
-- To list all available tool names run: `:lua require("mason-registry").get_all_package_names()`
--

local linters = {
	"ansible-lint",
	"commitlint",
	"cpplint",
	"editorconfig-checker",
	"hadolint",
	"kube-linter",
	"postgrestools",
	"ruff",
	"selene",
	"shellcheck",
	"sqlfluff",
	"tombi",
	"vint",
	"write-good",
	"yamllint",
}

local formatters = {
	"ast-grep",
	"black",
	"clang-format",
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
	"clangd",
	"diagnostic-languageserver",
	"docker-compose-language-service",
	"dockerfile-language-server",
	"jinja-lsp",
	"json-lsp",
	"just-lsp",
	"lua-language-server",
	"marksman",
	"powershell-editor-services",
	"pyright",
	"ruff-lsp",
	"sqls",
	"taplo",
	"terraform-ls",
	"vim-language-server",
	"yaml-language-server",
	-- "jqls", -- if supported in future
	-- "tree-sitter-query-language-server",   -- not listed in Mason registry, can only be installed via lspconfig
}

local debuggers = {
	"bash-debug-adapter",
	"cpptools",
	"debugpy",
	"local-lua-debugger-vscode",
	"netcoredbg",
}

return {
	lsp = lsp,
	dap = debuggers,
	null_ls = null_ls,
	linters = linters,
	formatters = formatters,
}
