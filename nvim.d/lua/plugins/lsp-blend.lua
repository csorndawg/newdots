-- all LSP configurations combined and packaged into 
-- single module thats sourced 
return 
  {
-- sourcing order explicitly mentioned in mason-lspconfig
-- mason > mason-lspconfig > lspconfig

-- mason
require("mason").setup()


-- mason-lspconfig
--,require("mason-lspconfig.nvim").setup()


-- now with mason/mason-lsp done, LSP servers are ready for custom config
-- before its ready to be sourced by init.lua





 }
