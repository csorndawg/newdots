" core vim configurations

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
set laststatus=2
set ruler
set wildmenu
set wildmode=list:full
"TODO: fix wildignore
set wildignore+=*/temp/*,*.temp,temp.*,*/Temp/*,*.so,*/ignore/*,*.ignore,*.zip,*.tmp  " ignore specific files and directories
set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline
set history=1500
set tabpagemax=50
set nohlsearch
set showmatch                       " highlight matching !!important!!
set showcmd                         " show command in bottom bar
set linebreak
set noerrorbells
set autoindent
set expandtab
set smartindent
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set complete-=i
set rnu
set smartcase
set colorcolumn=80
set hidden      " switch b/w buffers without having to save first
set noswapfile
set nobackup
