return {
	{
		"ggandor/leap.nvim",
		lazy = false,
		--name = "leap",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
}
