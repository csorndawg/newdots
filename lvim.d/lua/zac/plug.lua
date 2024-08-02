-- PLUGIN CONFIGURATIONS
--



-- fugitive
require("vim-fugitive").setup({
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit"
  },
  ft = {"fugitive"}
})

-- Below shouldn't be needed since Im not adding additional configuration to the default
-- vim surround instead of autopairs or whatever
-- require.setup(vim-surround).setup({
--   "tpope/vim-surround",
-- })

-- 
-- 
require("folke/todo-comments.nvim").setup({
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
        signs = false, -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "HOTFIX", "WORKAROUND", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          },
          TODO = { color = "default" },
          WARN = { color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { color = "default", alt = { "INFO" } },
          TEST = { color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE", -- The gui style to use for the fg highlight group.
          bg = "BOLD", -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        highlight = {
          multiline = true, -- enable multine todo comments
          multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
          before = "", -- "fg" or "bg" or empty
          keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg", -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          max_line_len = 400, -- ignore lines longer than this
          exclude = {}, -- list of file types to exclude highlighting
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#BF616A" },  -- red 
          warning = { "DiagnosticWarn", "WarningMsg", "#4C566A" },  -- yellow
          --default = { "Identifier", "#4c566a" },    -- light grey
          default = { "Identifier", "#5e81ac" },    -- nord9 (glacier)
          test = { "Identifier", "#b48ead" }       -- magenta
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          --pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          pattern = [[\b@?(KEYWORDS):]], -- ripgrep regex
        },
      }
})


-- plugins to explore/test 
--    https://github.com/akinsho/toggleterm.nvim
--    https://github.com/wakatime/vim-wakatime
--    https://github.com/ethanholz/nvim-lastplace 
--    https://github.com/npxbr/glow.nvim    # markdown in terminal
--    https://github.com/iamcco/markdown-preview.nvim   # markdown in browser
--    
--    fzf
--    nnoremap <leader>gf :GFiles<Cr>
--    nnoremap <leader>rg :Rg<Cr>
--    fzf for buffer exploration
--    nnoremap <silent><leader>l :Buffers<CR>

