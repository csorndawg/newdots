return {
	-- nordic.nvim colorscheme
	{
			'AlexvZyl/nordic.nvim',
			lazy = true,
			--priority = 1000,
			--config = function()
			--require 'nordic' .load()
			--end
	},

	-- alterante colorscheme
    {
	  'kaiuri/nvim-juliana',
	  lazy = true,
	  config = true,
    },

	-- more colorschemes
--	{
--	  "neanias/everforest-nvim",
--	  version = false,
--	  lazy = false,
--	  priority = 1000, -- make sure to load this before all the other start plugins
--	  -- Optional; default configuration will be used if setup isn't called.
--	  config = function()
--		require("everforest").setup({
--		  background = "soft",
--		 ui_contrast = "high",
--		 --- enable highlighting for common keywords like info/hint/error etc.
--		 diagnostic_text_highlight = true,
--		 ---diagnostic text color - two options ("grey" or "coloured")
--		 diagnostic_virtual_text = "coloured",
--		})
--	  end
--	},

    -- TODO: update config for plugins below, if needed (for now installing in
    --        the most vanilla way to speed up migration)
    -- preliminary installs 
    {"ggandor/leap.nvim", event = "VeryLazy"},

    -- melange-test
    --{"savq/melange-nvim"},

	-- install markdown-preview without yarn or npm
	--{
--		"iamcco/markdown-preview.nvim",
--		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--		ft = { "markdown" },
--		build = function() vim.fn["mkdp#util#install"]() end,
--	},
    
--	{
--	  "tpope/vim-fugitive",
--	  cmd = {
--		"G",
--		"Git",
--		"Gdiffsplit",
--		"Gread",
--		"Gwrite",
--		"Ggrep",
--		"GMove",
--		"GDelete",
--		"GBrowse",
--		"GRemove",
--		"GRename",
--		"Glgrep",
--		"Gedit"
--	  },
--	  ft = {"fugitive"}
--	},
--
    -- create/edit gists
	  {  
        "mattn/vim-gist",
        event = "BufRead",
        dependencies = "mattn/webapi-vim",
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
	  { "tpope/vim-repeat" },

}
