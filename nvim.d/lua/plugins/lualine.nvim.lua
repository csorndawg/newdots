return {
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      version = false,
			-- 
			options = {
				icons_enabled = false,		-- true by default
				--theme = "auto", -- set to "auto" to detect automatically
				--theme = "everforest", -- set to "auto" to detect automatically
				--theme = "onenord", -- set to "auto" to detect automatically
				--theme = "nordic", -- set to "auto" to detect automatically
				theme = "nord", -- set to "auto" to detect automatically
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				refresh = {
							statusline = 1000,
							tabline = 1000,
							winbar = 1000,
				}
			},
			sections = {
				lualine_a = {'mode'},
						lualine_b = {'branch', 'diff', 'diagnostics'},
						lualine_c = {'filename'},
						lualine_x = {'encoding', 'fileformat', 'filetype'},
						lualine_y = {'progress'},
						lualine_z = {'location'}
			},
    }
}
