" Core VIM Options Configurations
"

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
set incsearch   " highlight matches from ? and /
set smartcase
set colorcolumn=80
set hidden      " switch b/w buffers without having to save first
set noswapfile
set nobackup

" make undodir if not present
silent execute '!mkdir -p ~/.vim/undodir/'
set undodir=~/.vim/undodir  " need to create dir if DNE
set undofile

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

" disable auto code folding
set nofoldenable


" autocomplete settings
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest


" lines above/below cursor when possible
set scrolloff=4
set tabstop=2

" disable auto comment next line if current line is a comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
