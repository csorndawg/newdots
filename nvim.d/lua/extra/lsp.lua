--
-- IDE-LIKE CONFIG LOGIC - LSP, CMP, DAP, ETC.
--

-- LSPCONFIG

-- require() imports "plugin/lspconfig.lua"
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspp = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")
-- local lspicons = require("extra/cmp-lsp-lspkind")

-- define LSP servers
local servers = {
	ansiblels = {},
	awk_ls = {},
	bashls = {},
	diagnosticls = {},
	docker_compose_language_service = {},
	dockerls = {},
	jinja_lsp = {},
	-- jqls = {},
	lua_ls = {},
	pyright = {},
	ruff = {},
	sqls = {},
	taplo = {},
	ts_query_ls = {},
	vimls = {},
	yamlls = {},
	marksman = {},
}

-- @TESTING: Test vim.table.extends logic that I tried earlier in other LSP-extra file. Start small with debuggers first.

-- pre-install debuggers list
local debuggers = {
	"bash-debug-adapter",
	"debugpy",
}

-- pre-install linters list
local linters = {
	"ansible-lint",
	"commitlint",
	"hadolint",
	"ruff",
	"selene",
	"shellcheck",
	"sqlfluff",
	"vint",
	"write-good",
	"yamllint",
}

local formatters = {
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

-- @NOTE: Currently this is installed and sourcing correctly, but from "overrides.active". Need
-- to retest code, after moving it back into this file, before deleting override file.
-- require("extra.cmp-lsp-lspkind")

-- concat all non-lsp mason tools
local mason_nonlsp = {}
vim.list_extend(formatters, vim.list_extend(debuggers, linters))
vim.list_extend(mason_nonlsp, formatters)

-- install all non-lsp mason tools defined above
mason_tool_installer.setup({ ensure_installed = mason_nonlsp })

local ensure_installed2 = vim.tbl_keys(servers or {})
mason_tool_installer.setup({ ensure_installed = ensure_installed2 })
-- print("Post-Extend: ", vim.inspect(ensure_installed2))  -- view and confirm non-LSP install list is good

-- do things when language server attached to current buffer
-- print("Defining LSP on_attach")
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }

	-- first remap
	buf_set_keymap(
		"n",
		"<leader>lx",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ desc = "Declarations", noremap = true, silent = true }
	)
	-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>lk",
		"<cmd>lua vim.lsp.buf.hover()<CR>",
		{ desc = "Hover", noremap = true, silent = true }
	)
	buf_set_keymap("n", "<leader>lLi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>lLk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>lLw",
		"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
		{ desc = "Add workspaces", noremap = true, silent = true }
	)
	buf_set_keymap(
		"n",
		"<leader>lLR",
		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
		{ desc = "Remove workspaces", noremap = true, silent = true }
	)
	buf_set_keymap(
		"n",
		"<leader>lLv",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		{ desc = "List workspaces", noremap = true, silent = true }
	)
	buf_set_keymap("n", "<leader>lLD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>lLn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>lLc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "<leader>Lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>llLd",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		{ desc = "Line Diagnostics", silent = true, noremap = true }
	)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lLq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap(
		"n",
		"<space>cf",
		"<cmd>lua vim.lsp.buf.formatting()<CR>",
		{ desc = "Format code", noremap = true, silent = true }
	)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- print("servers table: ", vim.inspect(servers))  -- view list of LSP severs that will be installed
-- print("Setting up LSP capabilities for:")
for lsp in pairs(servers) do
	-- print("LSP Server = ", vim.inspect(lsp)) -- uncomment to debug any LSP server with attaching issues
	local config = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	-- ruff doesn't have textDocument features needed for things like (hover, go to definition, etc.)
	-- so need to use/setup pyright to handle those tasks while ruff covers linting/formatting tasks
	if lsp == "ruff" then
		-- skip since we only want ruff for linting/formatting purposes
		goto continue
	end

	-- Add SchemaStore config specifically for yaml-language-server
	if lsp == "yamlls" then
		config.settings = {
			yaml = {
				schemaStore = {
					enable = true, -- Auto-fetch schemas from SchemaStore
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
			},
		}
	end

	lspconfig[lsp].setup(config)
	::continue::
end
