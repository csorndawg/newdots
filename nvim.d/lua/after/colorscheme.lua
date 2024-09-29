-- configure colorscheme for nvim/nvim plugins (e.g. lualine)  
-- after plugins are loaded


-- COLORSCHEME

-- basic usage
--vim.cmd("colorscheme nord")
--set termguicolors
--set background=dark
--colorscheme nordbones
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme nordbones")


vim.g.nordbones = { solid_line_nr = true, darkness = 'warm', darken_comments = 45 }


-- LUALINE
vim.o.laststatus = vim.g.lualine_laststatus

-- lualine customization
require('lualine').setup {
    options = {
      theme = "auto",
      --icons_enabled = false,
      globalstatus = vim.o.laststatus == 3,
      --disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
      globalstatus = false,
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
      lualine_a = { "mode" },
      lualine_b = { "branch" },

      lualine_c = {
        --LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          --symbols = {
            --error = icons.diagnostics.Error,
            --warn = icons.diagnostics.Warn,
            --info = icons.diagnostics.Info,
            --hint = icons.diagnostics.Hint,
          --},
        },
        --{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filetype", separator = "", padding = { left = 1, right = 0 } },
        --{ LazyVim.lualine.pretty_path() },
      },
      lualine_x = {
          {
          "diff",
          --symbols = {
                --added = icons.git.added,
                --modified = icons.git.modified,
                --removed = icons.git.removed,
              --},
          },
      },
    },
    tabline = {},
    winbar = {},
    extensions = { "neo-tree", },
}



-- BUFFERLINE
vim.o.laststatus = vim.g.lualine_laststatus
require("bufferline").setup({
  options = {
        --theme = "nord",
        --theme = "nordbones",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
  }
})
