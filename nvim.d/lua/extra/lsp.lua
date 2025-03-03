--
-- IDE-LIKE CONFIG LOGIC - LSP, CMP, DAP, ETC.
--

-- LSPCONFIG

-- require() imports "plugin/lspconfig.lua"
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspp = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

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
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
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

------------------------
-- NVIM-CMP
------------------------

local cmp = require("cmp")
--local lspkind = require('lspkind')
local luasnip = require("luasnip")

-- better autocompletion experience
vim.o.completeopt = "menuone,noselect"

cmp.setup({
	-- Format the autocomplete menu
	-- formatting = {
	--		format = lspkind.cmp_format()
	--	},

	-- configure cmp popup menu
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		-- Use Tab and shift-Tab to navigate autocomplete menu
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		-- @EXPERIMENTAL - Change to smoother keybinding after confirming this
		-- will not break anything.
		--
		-- <c-f> will move you (f)orward (to the right) of each expansion locations
		-- <c-b> is similar, except moving you (b)ackwards.
		["<C-f>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),

		["<C-b>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),

		["<C-Space>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort() -- Close the completion menu without selecting any suggestion
			else
				fallback() -- Fall back to the normal <C-Space> functionality
			end
		end, { "i", "c", "s" }),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- default source hierarchy waterfall
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- { name = "dadbod" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmdline" },
	},

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			-- double underscore  methods (eg.  __repl__()) are sorted after, all other cmp choices
			-- keeps cmp options for Python clean and uncluttered
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
		-- priority_weight = {}	-- need to review docs first
	},
})

-- Now that standard cmp configuration is set by (set by above function)
-- we can EXTEND extra configurations that will override/patch any previously
-- existing setting (or add a new setting if not defined)

--
-- @NOTE: CMP extended configurations
--

-- set special cmp behavior for Cmdline and Search ('/','?') cmp
cmp.setup.cmdline({})

-- set special cmp behavior for Cmdline and Search ('/','?') cmp
cmp.setup.cmdline({})

-- need to add mysql/psql extensions also?
cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})
