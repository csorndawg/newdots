-- source:  https://github.com/olivercederborg/poimandres.nvim

-- wrap table and return
return {

  -- COLORSCHEME
  { 
    'olivercederborg/poimandres.nvim',
    --lazy = false,		-- only set to "true" only for main colorscheme
    --priority = 1000,
    config = function()
    require('poimandres').setup {
      bold_vert_split = true, -- use bold vertical separators
      dim_nc_background = false, -- dim 'non-current' window backgrounds
      disable_background = false, -- disable background
      disable_float_background = false, -- disable background for floats
      disable_italics = false, -- disable italics
    }

    -- LUALINE
    require('lualine').setup {
      options = { theme = 'poimandres' }
    }
  end ,
  }
}
