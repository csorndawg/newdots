-- onenord colorscheme configuration
-- for more info see: 
--  https://www.lunarvim.org/docs/configuration/appearance/colorschemes

require('onenord').setup({
  theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color
    float_background = false, -- Disable setting the background color for floating windows
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})


-- example: overwriting default highlight groups and colors
---local colors = require("onenord.colors").load()
---
---require("onenord").setup({
---  custom_highlights = {
---    ["@constructor"] = { fg = colors.dark_blue },
---  },
---  custom_colors = {
---    red = "#ffffff",
---  },
---})


-- LuaLine
require('lualine').setup({
  options = {
    theme = 'onenord'
  }
})


-- colorscheme final
lvim.colorscheme = "onenord"

-- lualine  final
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_c = { "diff" }
lvim.builtin.lualine.options.theme = "onenord"
