-- Define LSP servers, DAP debuggers, Code Linters, and Code Formatters for Mason to install

-- Central list of tools to install via Mason

local linters = {
	"shellcheck",
	"yamllint",
	"ansible-lint",
	"ruff",
	"commitlint",
	"vint",
	"sqlfluff",
	"write-good",
	"hadolint",
	"selene",
	"phpcs",
	"bacon",
}

local formatters = {
	"black",
	"stylua",
	"shfmt",
	"yamlfmt",
	"jq",
	"sqlfmt",
	"superhtml",
	"xmlformatter",
	"ruff",
	"duster",
}

local null_ls = {}
vim.list_extend(null_ls, linters)
vim.list_extend(null_ls, formatters)

local lsp = {
	"ansiblels",
	"awk_ls",
	"bashls",
	"dockerls",
	"docker_compose_language_service",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"pyright",
	"sqls",
	"taplo",
	"ts_query_ls",
	"vimls",
	"yamlls",
	"marksman",
	"diagnosticls",
	"sorbet",
	-- "jqls",
}

local debuggers = {
	"debugpy",
	"bash-debug-adapter",
	"firefox-debug-adapter",
}

return {
	lsp = lsp,
	dap = debuggers,
	null_ls = null_ls,
	linters = linters,
	formatters = formatters,
}
