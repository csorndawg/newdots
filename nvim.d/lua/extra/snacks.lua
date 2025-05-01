-- plugin installer code for snacks.nvim
-- code installs select snack submodule with their defaults, then overrides
-- and/or adds additional configurations from the custom snacks config files in "extra/snacks_extra"

-- lua/plugins/snacks.lua
return {
	"folke/snacks.nvim",
	event = "VeryLazy",

	config = function()
		require("snacks").setup(require("extra.snacks_extra"))
		require("nvim.d.lua.extra.snacks_extra/snacks_keymaps") -- if you're using this
	end,
}
