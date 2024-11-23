-- IDE-LIKE CONFIG LOGIC - LSP, CMP, DAP, ETC.


-- LSPCONFIG

-- require() imports "plugin/lspconfig.lua" 
local nvimd_lsp = require('lspconfig')
 
-- define LSP servers 
local servers = { 'pyright', 'ansiblels', 'bashls', 'yamlls', 'docker_compose_language_service', 'dockerls' }

-- create local lua function to create ("require") LSP server for all lang servers in "local servers"
local on_attach = function(client,bufnr)
	-- do things when language server 
	-- attached to current buffer 
end

for _, lsp in ipairs(servers) do

	-- nvimd_lsp[lsp].setup {}	-- installs LSP server, but will not be recognized unless manually referenced/called

	-- run local on_attach function, which allows files to be
	-- recognize/picked up by its LSP server (if exists), for each server
	nvimd_lsp[lsp].setup {
		on_attach = on_attach
	}
end
