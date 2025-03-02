-- @TODO: See if this can be refactored into a `cmp` extra module, where
-- 				all other cmp configuration exist
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		-- allow luansip to access community snippets
		"$HOME/.local/share/nvim/lazy/friendly-snippets/",
	},
})
