------------------------------------------------------------------------------------
-- LSP Config V2
------------------------------------------------------------------------------------

-- import dependencies
local lspconfig = require("lspconfig")
local mason = require("extra.mason")
local lsp_util = require("extra.lsp.lsp_utils")

-- Convert Mason LSP list to valid lspconfig servers
local valid_servers = lsp_util.filter_lspconfig_servers(mason.lsp)

-- build LSP servers table dynamically after translating "Mason LSP" to "lspconfig" format
local servers = {}
for _, name in ipairs(valid_servers) do
	servers[name] = {}
end
servers["ts_query_ls"] = {} -- must install here since treesitter-query LSP not available in Mason registry

-- special handling for ruff (ruff is only for linting/formatting, not LSP)
-- servers["ruff"] = nil

-- setup LSP capabilities and on_attach settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
	end

	map("n", "<leader>lx", vim.lsp.buf.declaration, "LSP Declarations")
	map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	map("n", "<leader>lk", vim.lsp.buf.hover, "Hover (L)")
	map("n", "<leader>lLi", vim.lsp.buf.implementation, "Implementations")
	map("n", "<leader>lLk", vim.lsp.buf.signature_help, "Signature Help")
	map("n", "<leader>lLw", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
	map("n", "<leader>lLR", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
	map("n", "<leader>lLv", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "List Workspaces")
	map("n", "<leader>lLD", vim.lsp.buf.type_definition, "Type Definition")
	map("n", "<leader>lLn", vim.lsp.buf.rename, "Rename Symbol")
	map("n", "<leader>lLc", vim.lsp.buf.code_action, "Code Action")
	map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
	map("n", "<leader>lLq", vim.diagnostic.setloclist, "Diagnostics Loclist")
	map("n", "<space>cf", vim.lsp.buf.format, "Format Code")
end

-- Setup LSP servers
for lsp, _ in pairs(servers) do
	local config = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	-- yamlls: add schema store config
	if lsp == "yamlls" then
		config.settings = {
			yaml = {
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
			},
		}
	end

	lspconfig[lsp].setup(config)
end
