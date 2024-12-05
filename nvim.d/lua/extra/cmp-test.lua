-- experimental/test config file

-- test code to have LuaSnip efficiently source example snippets
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		-- TODO: After confirming snippet paths work, try and replace
		--       "/home/../newdots" with "$HOME/git" so it works on
		--       all my machines.
		--
		-- friendly-snippets
		"$HOME/.local/share/nvim/lazy/friendly-snippets/",

		-- @FIXME: custom nvim-scissors snippets dont load when using ENV. VARIABLE
		-- and must have path explictly defined. Goal is to make this portable
		-- for different hosts, dynamically.
		-- custom snippets
		"/home/zc/git/newdots/nvim.d/snippets/",
		--"$HOME/dotfiles/nvim.d/snippets/",
	},
})
