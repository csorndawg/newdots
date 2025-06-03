-- Define LSP servers, DAP debuggers, Code Linters, and Code Formatters for Mason to install

-- LSP servers
local lsp = {
		"ansiblels",
		"awk_ls",
		"bashls",
		"diagnosticls",
		"docker_compose_language_service",
		"dockerls",
		"jinja_lsp",
		"lua_ls",
		"marksman",
		"pyright",
		"ruff-lsp",
		"sqls",
		"taplo",
		"ts_query_ls",
		"vimls",
		"yamlls",
		-- "jqls",
}

-- DAP debuggers
local debuggers = {
		"bash-debug-adapter",
		"debugpy",
}

-- null-ls Linters
linters = {
		"ansible-lint",
		"commitlint",
		"hadolint",
		-- "ruff",
		"selene",
		"shellcheck",
		"sqlfluff",
		"ty",
		"vint",
		"write-good",
		"yamllint",
}

	-- null-ls Formatters
local	formatters = {
		"black",
		"jq",
		"ruff",
		"sqlfmt",
		"shfmt",
		"stylua",
		"superhtml",
		"xmlformatter",
		"yamlfmt",
}


-- combine linters/formatters for null-ls
local null_ls = {}
vim.list_extend(null_ls, linters)
vim.list_extend(null_ls, formatters)

-- return lsp, dap, null_ls tables
return {
	lsp = lsp,
	dap = debuggers, 
	null_ls = null_ls
}
