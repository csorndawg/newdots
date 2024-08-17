return {
	-- nordic.nvim colorscheme
	{
			'AlexvZyl/nordic.nvim',
			lazy = false,
			priority = 1000,
			config = function()
					require 'nordic' .load()
			end
	},

	-- alterante colorscheme
    {
	  'kaiuri/nvim-juliana',
	  lazy = false,
	  --opts = { --[=[ configuration --]=] },
	  config = true,
    },

	-- more colorschemes
	{
	  "neanias/everforest-nvim",
	  version = false,
	  lazy = false,
	  priority = 1000, -- make sure to load this before all the other start plugins
	  -- Optional; default configuration will be used if setup isn't called.
	  config = function()
		require("everforest").setup({
		  background = "soft",
		 ui_contrast = "high",
		 --- enable highlighting for common keywords like info/hint/error etc.
		 diagnostic_text_highlight = true,
		 ---diagnostic text color - two options ("grey" or "coloured")
		 diagnostic_virtual_text = "coloured",
		})
	  end
	},
}

