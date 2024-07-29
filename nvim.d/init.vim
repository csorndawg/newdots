" TODO: clean up and modularize
set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.vim/rt
let &packpath = &runtimepath

" source vimscript configuration modules
source ~/.vim/rt/core.vimrc
source ~/.vim/rt/remaps.vimrc

" autocomplete settings
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest

" -------------------------------------------------------
"" PLUGINS/POST-VIMRC SOURCING CONFIGURATION
" -------------------------------------------------------

call plug#begin("$HOME/.config/nvim/plugs")

Plug 'junegunn/seoul256.vim'

" On-demand loading: loaded when the specified command is executed
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/vimux'
Plug 'ervandew/supertab'
Plug 'shaunsingh/nord.nvim'
Plug 'honza/vim-snippets'
"Plug 'arcticicestudio/nord-vim'

"" snippets
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'petertriho/cmp-git'

" debuggers
Plug "nvim-telescope/telescope-dap.nvim"
Plug "mfussenegger/nvim-dap"
Plug "mfussenegger/nvim-dap-python"

call plug#end()



" neovim ultisnip completion 
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
  --  sources = cmp.config.sources({
  --   { name = 'git' },
  -- }, {
  --    { name = 'buffer' },
  --  })
 -- })
 -- require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- @TODO: FIX YOUR_LSP_SERVER
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF



" nord.nvim lua configuration
lua <<EOF
require("nord").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
  borders = true, -- Enable the border between verticaly split windows visible
  errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                            -- values : [bg|fg|none]
  search = { theme = "vim" }, -- theme for highlighting search results
                              -- values : [vim|vscode]
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},

    -- To customize lualine/bufferline
    bufferline = {
      current = {},
      modified = { italic = true },
    },
  },

  -- colorblind mode
  -- see https://github.com/EdenEast/nightfox.nvim#colorblind
  -- simulation mode has not been implemented yet.
  colorblind = {
    enable = false,
    preserve_background = false,
    severity = {
      protan = 0.0,
      deutan = 0.0,
      tritan = 0.0,
    },
  },

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with all highlights and the colorScheme table
  on_highlights = function(highlights, colors) end,
})

vim.cmd.colorscheme("nord")
EOF

" ignore errors if colorscheme not yet installed
"silent! colorscheme seoul256





"" ------------------------------------------------
"" PLUGIN CONFIG 
"" ------------------------------------------------

" undodir
silent execute '!mkdir -p ~/.nvim/undodir/'
set undodir=~/.vim/undodir  " need to create dir if DNE
set undofile
noremap <leader>u :UndotreeShow<CR>

" recover accidentally deleted text with undo (`u` in normal mode)
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"" ale

" lint on save only 
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0  " disable fixer 

" error symbols
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" error strings format 
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" only lint below filetypes with below linters
let g:ale_linters = {
  \ 'python': ['flake8'] ,
  \ 'bash': ['shellcheck'] ,
  \ 'sh': ['shellcheck'] ,
  \ 'yaml': ['yamllint'] ,
  \ }

" easier error cycling w/ `CTRL-e` 
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" display number of errors/warnings in status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d. %d● ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

"" ultisnip super-tab enhanced TAB COMPLETE
"" better key bindings for UltiSnipsExpandTrigger
let g:SuperTabDefaultCompletionType = '<tab>'
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpOrExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<leader>lus"
let g:UltiSnipsEditSplit="vertical"		" default is horizontal
" for custom snippets create <snip type>_custom.<snip file extension>`


function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

" YAML
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
let g:indentLine_char = '⦙'

" Python
au BufNewFile,BufRead *.py 
    \ set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
    \ autoindent fileformat=unix

set nu
