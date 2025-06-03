-- Install Mason plugin + all predefined Mason (LSP/Linters/Formatters/DAP debuggers) installs

-- source all predefined "Mason" installs
local mason_tools = require("extra.mason.mason")

-- install mason
require("mason").setup()

-- install LSP servers
require("mason-lspconfig").setup({
  ensure_installed = mason_tools.lsp,
  automatic_installation = true,
})

-- install formatters/linters
require("mason-null-ls").setup({
  ensure_installed = mason_tools.null_ls,
  automatic_installation = true,
})

-- install DAP debuggers
require("mason-nvim-dap").setup({
  ensure_installed = mason_tools.dap,
  automatic_installation = true,
})

