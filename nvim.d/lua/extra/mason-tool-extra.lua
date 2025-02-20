-- EXPERIMENTAL MASON INSTALLER/BOOTSTRAPPER


local mason_tool_installer = require('mason-tool-installer')



local srvrs = {
  "ansiblels",
  "awk_ls",
  "azure_pipelines_ls",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "ruff",
  "sqls",
  "taplo",
  "ts_query_ls",
  "vimls",
  "yamlls",
}

local linters = {
  'yamllint',
  'write-good',
  'selene',
  'shellcheck',
  'ruff',
}

local debuggers = {
  'debugpy',
  'bash-debug-adapter',
}

local formatters = {
  'sqlfmt',
  'shfmt',
  'xmlformatter',
}

-- prep ensure_installed table by merging all subtables defined above
local function merge_tables(...)
    local merged = {}
    for _, t in ipairs({...}) do
	vim.list_extend(merged, t) -- Extends merged table with elements from t
    end
    return merged
end
  -- merge all Mason tools into single table and pass as arg. to ensure_installed
local mason_install_tbl = merge_tables(srvrs,linters, formatters, debuggers)
print(vim.inspect(mason_install_tbl))

mason_tool_installer.setup {
  vim.list_extend(ensure_installed,mason_install_tbl),
  auto_update = false,
  run_on_start = true,
  start_delay = 3000, -- 3 second delay
  debounce_hours = 5, -- at least 5 hours between attempts to install/update
  integrations = {
    ['mason-lspconfig'] = true,
    ['mason-null-ls'] = true,
    ['mason-nvim-dap'] = true,
  },
}

return mason_tool_installer
-- @IMPORTANT: Run below to help debug issues
--print(vim.inspect(ensure_installed))
