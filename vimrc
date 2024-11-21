" MONOLITHIC VIMRC
" 
" @TODO - Refactor into modular VIMRC files. Use the tags (col1 in modular tag
" table) to easily find and move certain VIMRC logic to its dedicated config file (col3 in below modular tag table).
"
"
" MODULAR VIMRC TAGS 
"   OPTSS ; core vim options (eg. `set rnu`) ; opts.vimrc
"   PLUGG ; vim plugin remaps (eg. `colorscheme nord`) ; plugg.vimrc
"   REMAPP ; core vim remaps (eg. `nnoremap <Leader>, i`) ; remaps.vimrc
"   FUNCTSS ; core vim vimscript functions (see: https://learnvim.irian.to/vimscript/vimscript_functions) ; functs.vimrc
"   MISCC ; anything else that isnt covered by above 4 tags ; misc.vimrc
"   EXPP ; experimental changes for the above 5 tags ; experimental.vimrc
"

" @OPTSS
" ------------------------
"  GENERAL 
" ------------------------

" remap leader to <space>
let mapleader= " "

set  nocompatible
filetype plugin indent on
syntax on
let g:is_posix = 1  " correctly highlight $() if filetype=sh
set showmatch                       " highlight matching !!important!!
set showcmd                         " show command in bottom bar
"syntax enable
set linebreak
set noerrorbells
set autoindent
set expandtab
set smartindent
set tabstop=4 
set softtabstop=4
set shiftwidth=4
"set complete-=i
set nu
set rnu
set smartcase
set colorcolumn=80
set hidden      " switch b/w buffers without having to save first
set noswapfile
set nobackup

" make undodir if not present
silent execute '!mkdir -p ~/.vim/undodir/'
set undodir=~/.vim/undodir  " need to create dir if DNE
set undofile
set incsearch   " highlight matches from ? and /
set laststatus=2 
set wrapscan    " wrap search results
set splitbelow
set splitright
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start
set nrformats-=octal
set ttimeout
set ttimeoutlen=10
set incsearch
set laststatus=2
set ruler
set wildmenu
"set wildmode=longest,list
set wildmode=list:full
set wildignore+=*/tmp/*,*.so,*/ignore/*,*.ignore,*.zip,*.tmp  " ignore specific files and directories
set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline
set history=1500
set tabpagemax=50
set nohlsearch


" autocomplete settings
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest

" --------------------------------------------
"   LEADER 
" --------------------------------------------


" decrease leader timeout latency (default 1000 ms)
"set ttimeoutlen=500
" set latency for mappings  to 300ms and 100ms for normal vim commands
set timeout timeoutlen=300 ttimeoutlen=100

 
"  tmux-like commands for better window navigation remaps (change to mirror tmux)
nnoremap <C-h> <C-w>h      
nnoremap <C-j> <C-w>j      
nnoremap <C-k> <C-w>k      
nnoremap <C-l> <C-w>l      


" Mode switching remaps

"" `<ALT>,` normal mode mapping is broken
""  using <Leader>, (<SPACE>,) as workaround
" `<Alt>,` toggles Normal/Insert mode 
inoremap <A-,> <ESC>
inoremap <A-,> <C-c>
nnoremap <Leader>, i


" toggle Normal/Command mode with <SPACE>: and <Alt>; 
"nnoremap <leader>, :
"cnoremap <A-,> <C-c>
" fallback: cnoremap <A-,> <ESC>
" shortcut back to Normal mode from 'Search' mode
"cnoremap <A-/> <C-c>
"cnoremap <A-/> <ESC>
"cnoremap <A-/> <ESC>


"" use arrows keys for additionally mode switching method

" Insert/Command Mode switching
imap <leader><up> <ESC>:
cmap <leader><up> <C-c>i

" use arrows keys for additionally mode switching method
imap <leader><down> <ESC>
nmap <leader><down> i

" use <left/right> for cmo since <up/down> used for history cycling
cmap <leader><left> <ESC>
nmap <leader><left> :
 
" ------------------------
" REMAPS
" ------------------------
" recover accidentally deleted text with undo (`u` in normal mode)
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>


" autocomplete settings
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest

" ------------------------
"  VIM-PLUG
" ------------------------


" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" now that plugin dirs exist, install plugin 
call plug#begin()

Plug 'AlexvZyl/nordic.nvim'
Plug 'SirVer/ultisnips'
Plug 'arcticicestudio/nord-vim'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
"Plug 'neanias/everforest-nvim'
Plug 'nordtheme/vim'
Plug 'preservim/vimux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'xero/miasma.nvim' 
Plug 'sheerun/vim-polyglot'
Plug 'preservim/tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-commentary'



" Experimental Plugins
" ======================

" wilder.nvim
"Plug 'gelguy/wilder.nvim'
"  wilder.nvim dependencies
"  allows use of Python remote plugin features in Vim, can be skipped
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'

" @FIXME
" codi.vim
"Plug 'metakirby5/codi.vim'

" If you have nodejs
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


call plug#end()


" ------------------------
" PLUGIN CONFIG/REMAP
" ------------------------


" colorscheme
set t_Co=256
set background=dark
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_underline = 1
"let g:nord_italic_comments = 1
colorscheme nord

" airline
"let g:airline#extensions#tabline#enabled = 1   " enable tabline buffer list

" custom airline 
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''


" undodir
noremap <leader>u :UndotreeShow<CR>

" ale

" lint on save only 
let g:ale_disable_lsp = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0  " disable fixer 

" disable virtualtext, as Linter warning/error described in statusline
let g:ale_virtualtext_cursor = 0
"let g:ale_virtualtext_cursor = 'current'

" error symbols
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" error strings format 
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_error_str = '>>'
"let g:ale_echo_msg_warning_str = '--'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" only lint below filetypes with below linters
let g:ale_linters = {
  \ 'asciidoc': ['write-good'] ,
  \ 'text': ['write-good'] ,
  \ 'bash': ['shellcheck'] ,
  \ 'git commit': ['gitlint'] ,
  \ 'json': ['prettier'] ,
  \ 'lua': ['stylua'] ,
  \ 'markdown': ['write-good'] ,
  \ 'python': ['flake8'] ,
  \ 'sh': ['shellcheck'] ,
  \ 'sql': ['sqlfluff'] ,
  \ 'yaml': ['yamllint'] ,
  \ }
let g:ale_python_flake8_options = '--ignore=E501,W291'

" removed linters
"\ 'mail': ['prose-lint'] ,
"\ 'go': ['gofmt'] ,

let g:ale_fixers = {
\ 'python': ['black','remove_trailing_lines', 'trim_whitespace'],
\}


" easier error cycling w/ `<CTRL-e>/<Ctrl-E>` 
nmap <silent> <C-e> <Plug>(ale_next_wrap)
nmap <silent> <C-E> <Plug>(ale_previous_wrap)

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

"OUTDATED--"" ultisnip super-tab enhanced TAB COMPLETE
"OUTDATED--"" better key bindings for UltiSnipsExpandTrigger
"OUTDATED--let g:SuperTabDefaultCompletionType = '<tab>'
"OUTDATED--"let g:UltiSnipsExpandTrigger="<tab>"
"OUTDATED--let g:UltiSnipsJumpOrExpandTrigger="<tab>"
"OUTDATED--let g:UltiSnipsJumpForwardTrigger="<tab>"
"OUTDATED--let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"OUTDATED--let g:UltiSnipsListSnippets="<leader>lus"
"OUTDATED--let g:UltiSnipsEditSplit="vertical"		" default is horizontal
"OUTDATED--" for custom snippets create <snip type>_custom.<snip file extension>`
"OUTDATED--
"OUTDATED--
"OUTDATED--function! g:UltiSnips_Complete()
"OUTDATED--  call UltiSnips#ExpandSnippet()
"OUTDATED--  if g:ulti_expand_res == 0
"OUTDATED--    if pumvisible()
"OUTDATED--      return "\<C-n>"
"OUTDATED--    else
"OUTDATED--      call UltiSnips#JumpForwards()
"OUTDATED--      if g:ulti_jump_forwards_res == 0
"OUTDATED--        return "\<TAB>"
"OUTDATED--      endif
"OUTDATED--    endif
"OUTDATED--  endif
"OUTDATED--  return ""
"OUTDATED--endfunction
"OUTDATED--
"OUTDATED--function! g:UltiSnips_Reverse()
"OUTDATED--  call UltiSnips#JumpBackwards()
"OUTDATED--  if g:ulti_jump_backwards_res == 0
"OUTDATED--    return "\<C-P>"
"OUTDATED--  endif
"OUTDATED--
"OUTDATED--  return ""
"OUTDATED--endfunction
"OUTDATED--
"OUTDATED--
"OUTDATED--if !exists("g:UltiSnipsJumpForwardTrigger")
"OUTDATED--  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"OUTDATED--endif
"OUTDATED--
"OUTDATED--if !exists("g:UltiSnipsJumpBackwardTrigger")
"OUTDATED--  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"OUTDATED--endif
"OUTDATED--
"OUTDATED--"let g:UltiSnipsSnippetDirectories = ['~/.vim/mysnippets', 'UltiSnips']
"OUTDATED--"let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'vimsnips']


" `%%` expands to dirpath of current buffer in cmdline mode
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" =============================================
"   BELOW REMAPS <ALT>; KEY SUCESSFULLY to `:`
" =============================================

" normal-insert mode remaps
"  switch b/w nmo/cmo with `<space>;` and <ALT-;>
nnoremap <leader>; :
cnoremap <A-;> <C-c>


" paste toggle
nnoremap <leader>pp :set paste<CR>
nnoremap <leader>PP :set nopaste<CR>


" tmux-like commands for better window navigation remaps 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set foldmethod=indent


 
" ------------------------------------------------------------
" Misc. Plugins Configuartions

" 	tagbar
"let g:tagbar_autoclose   = 0
"let g:tagbar_autofocus   = 1
"let g:tagbar_autoshowtag = 0
let g:tagbar_compact     = 1
let g:tagbar_indent      = 0
let g:tagbar_foldlevel   = 99
"nnoremap <F9> :TagbarToggle<CR>| " bind TagBar to hotkey F9


" ------------------------------------------------------------
"  FZF.VIM 

" Initialize configuration dictionary
let g:fzf_vim = {}

" FZF.VIM colorscheme

" NORD.NVIM colorscheme
let g:terminal_ansi_colors = [
            \ '#2E3440', '#3B4252', '#434C5E', '#616E88',
            \ '#D8DEE9', '#E5E9F0', '#ECEFF4', '#8FBCBB',
            \ '#88C0D0', '#81A1C1', '#5E81AC', '#BF616A',
            \ '#D08770', '#EBCB8B', '#A3BE8C', '#B48EAD'
            \ ]

" NORDBONES FZF.VIM colorschme
"let g:terminal_ansi_colors = [
"            \ '#2F3541', '#C1616A', '#A4BE8D', '#CF866F',
"            \ '#8FBCBA', '#B38DAC', '#87BFCE', '#EBEEF3',
"            \ '#475063', '#D6787F', '#A8CC86', '#E09680',
"            \ '#89CAC8', '#CF97C5', '#82CCE0', '#A5B4CD'
"            \ ]


" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Buffers] Jump to the existing window if possible (default: 0)
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }

" FZF.VIM Commands
nnoremap <C-f> :Rg!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
" search for files under $HOME `~`
nnoremap <silent> <leader>fh :Files ~<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
" search for git files under $HOME `~`
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>gsh :GFiles?<CR>
nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>s :Snippets<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>nm :Maps<CR>
"nnoremap <silent> <leader>t :Tags<CR>      "@TODO


" Ex-Mode Command History
nnoremap <silent> <leader>ch :History:<CR>
" Ex-Mode Search History
nnoremap <silent> <leader>sh :History/:<CR>


" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
inoremap <leader><leader>w <plug>(fzf-complete-word)
inoremap <leader><leader>l <plug>(fzf-complete-line)
inoremap <expr> <leader><leader>p fzf#vim#complete#path('rg --files')
"inoremap <expr> <leader><leader>p fzf#vim#complete#path('fd')


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" The query history for this command will be stored as 'ls' inside g:fzf_history_dir.
" The name is ignored if g:fzf_history_dir is not defined.

command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))


" Global line completion (not just open buffers. ripgrep required.)
"inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"  \ 'prefix': '^.*$',
"  \ 'source': 'rg -n ^ --color always',
"  \ 'options': '--ansi --delimiter : --nth 3..',
"  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Hide statusline for FZF terminal buffers
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler



" ------------------------------------------------------------
"  VIMUX

" prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" zoom the tmux runner pane
nnoremap <leader>vz :VimuxZoomRunner<CR>


" VIMUX CUSTOM - BASH/PYTHON REPL

" PYTHON REPL-like functionality    (vrp= Vimux Run/REPL Python)
"nnoremap <Leader>vpp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>

" TODO 
" <LOGIC TO CHECK IF PYTHON OR BASH> 
" <LOGIC THAT RUNS FOR PYTHON FILE>
" <PYTHON ALSO REQUIRES VIRTUAL ENV. ACTIVATED>  --- VO='source /home/shelby-sensation/.local/state/python/venvs/venv/bin/activate'
"nnoremap <Leader>vpp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
" <LOGIC THAT RUNS FOR BASH FILE>
"nnoremap <Leader>vb :call VimuxRunCommand("clear; bash " . bufname("%"))<CR>

" IDEAS.TODO 
" <VIMUX REMAP/KEYBIND for activating python VENV (needs to work for
" non-default VO VENVS)

" ------------------------------------------------------------
"  FZF.VIM 

" Initialize configuration dictionary
let g:fzf_vim = {}

" FZF.VIM colorscheme

" NORD.NVIM colorscheme
let g:terminal_ansi_colors = [
            \ '#2E3440', '#3B4252', '#434C5E', '#616E88',
            \ '#D8DEE9', '#E5E9F0', '#ECEFF4', '#8FBCBB',
            \ '#88C0D0', '#81A1C1', '#5E81AC', '#BF616A',
            \ '#D08770', '#EBCB8B', '#A3BE8C', '#B48EAD'
            \ ]

" NORDBONES FZF.VIM colorschme
"let g:terminal_ansi_colors = [
"            \ '#2F3541', '#C1616A', '#A4BE8D', '#CF866F',
"            \ '#8FBCBA', '#B38DAC', '#87BFCE', '#EBEEF3',
"            \ '#475063', '#D6787F', '#A8CC86', '#E09680',
"            \ '#89CAC8', '#CF97C5', '#82CCE0', '#A5B4CD'
"            \ ]


" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Buffers] Jump to the existing window if possible (default: 0)
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }

" FZF.VIM Commands
nnoremap <C-f> :Rg!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
" search for files under $HOME `~`
nnoremap <silent> <leader>fh :Files ~<CR>
nnoremap <silent> <leader>gf :GFiles<CR>
" search for git files under $HOME `~`
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>gsh :GFiles?<CR>
nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>s :Snippets<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>nm :Maps<CR>
"nnoremap <silent> <leader>t :Tags<CR>      "@TODO


" Ex-Mode Command History
nnoremap <silent> <leader>ch :History:<CR>
" Ex-Mode Search History
nnoremap <silent> <leader>sh :History/:<CR>


" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
inoremap <leader><leader>w <plug>(fzf-complete-word)
inoremap <leader><leader>l <plug>(fzf-complete-line)
inoremap <expr> <leader><leader>p fzf#vim#complete#path('rg --files')
"inoremap <expr> <leader><leader>p fzf#vim#complete#path('fd')


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" The query history for this command will be stored as 'ls' inside g:fzf_history_dir.
" The name is ignored if g:fzf_history_dir is not defined.

command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))


" Global line completion (not just open buffers. ripgrep required.)
"inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"  \ 'prefix': '^.*$',
"  \ 'source': 'rg -n ^ --color always',
"  \ 'options': '--ansi --delimiter : --nth 3..',
"  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Hide statusline for FZF terminal buffers
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler



" ------------------------------------------------------------
"  VIMUX

" prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" zoom the tmux runner pane
nnoremap <leader>vz :VimuxZoomRunner<CR>


" VIMUX CUSTOM - BASH/PYTHON REPL

" PYTHON REPL-like functionality    (vrp= Vimux Run/REPL Python)
"nnoremap <Leader>vpp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>

" TODO 
" <LOGIC TO CHECK IF PYTHON OR BASH> 
" <LOGIC THAT RUNS FOR PYTHON FILE>
" <PYTHON ALSO REQUIRES VIRTUAL ENV. ACTIVATED>  --- VO='source /home/shelby-sensation/.local/state/python/venvs/venv/bin/activate'
"nnoremap <Leader>vpp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
" <LOGIC THAT RUNS FOR BASH FILE>
"nnoremap <Leader>vb :call VimuxRunCommand("clear; bash " . bufname("%"))<CR>

" IDEAS.TODO 
" <VIMUX REMAP/KEYBIND for activating python VENV (needs to work for
" non-default VO VENVS)

" ------------------------------------------------------------
"  YCM 
"
"  Python 
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.local/bin/global_extra_conf.py'


" clear comp menu after selection
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_disable_signature_help = 1


" ------------------------------------------------------------
"  Fugitive
" ------------------------------------------------------------

" TODO: remap below
"Gdiffsplit!
"Gvdiffsplit!
"diffput //2 //3
"diffget //2 //3
" Gwrite[!]
" Gstatus

" All FUGITIVE mappings will begin with <Leader>f (f for Fugitive)
" Example: <leader>fd   >> Fugitive Diff split

" Fugitive Diff
nnoremap <leader>fd :Gvdiffsplit!<CR>

" Fugitive Merge Conflict diffput/diffget
"
" Fugitive put Left (h) hand buffer
nnoremap <leader>fph :diffput //2<CR>
nnoremap <leader>dp2 :diffput //2<CR>
" Fugitive put Right (l) hand buffer
nnoremap <leader>fpl :diffput //3<CR>
nnoremap <leader>dp3 :diffput //3<CR>

" Fugitive get left (h)
nnoremap <leader>fgh :diffget //2<CR>
nnoremap <leader>fg2 :diffget //2<CR>
" Fugitive get right (l)
nnoremap <leader>fgl :diffget //3<CR>
nnoremap <leader>fg3 :diffget //3<CR>


" Fugitive write
nnoremap <leader>fw :Gwrite!<CR>

" Fugitive status
nnoremap <leader>fs :Gstatus<CR>
"nnoremap <leader>f :<CR>


" ------------------------------------------------------------
" WINCENT AUTOCOMP HACK FOR ULTISNIPS and YCM
" ------------------------------------------------------------

source ~/dotfiles/vim.d/autocomp.vim


" ------------------------------------------------------------
" EXPERIMENTAL
" ------------------------------------------------------------


" @REMAPP
nnoremap <leader>vh :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>

" @FUNCTSS
" CTAGS
" Set `<Space>ct` to generate tags for non-markdown/txt files
augroup NonMarkdownTxtTags
    autocmd!
    autocmd FileType markdown,txt let b:non_c_tags=1
augroup end
if !exists("b:non_c_tags")
    "nnoremap <f5> :!ctags -R<CR>
    nnoremap <leader>ct :!ctags -R<CR>
endif

" tell VIM where to find/search for Ctags 
set tags=./.tags;$HOME


" <Leader><Leader> -- Open last buffer.
nnoremap <Leader>lb <C-^>

nnoremap <Leader>o :only<CR>

" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <Leader>ep :echo expand('%')<CR>

nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>


" <Leader>e -- Edit file, starting in same directory as current file.
"nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>


" @PLUGG
" =======================================================
" ULTISNIPS V2
" =======================================================
"
"let g:UltiSnipsEditSplit="vertical"
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:UltiSnipsExpandTrigger = '"<tab>"
"let g:UltiSnipsJumpForwardTrigger = '"<tab>"
"let g:UltiSnipsJumpBackwardTrigger = '"<s-tab>"


" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<A>', '<C-p>', '<Up>']


" @REMAP
cnoremap terminal vert terminal<CR>
