return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		config = function()
			-- LSP setup syntax: require("lspconfig").<Mason LSP server name>.setup({})
			-- lua-language-server LSP server ("lua_ls" in Mason)
			require("lspconfig").lua_ls.setup({})
		end,
	},
}
