" VIMRC vim-plug configuration/setup
"
" VIMRC module for installing and configuring vim-plug plugin manager, along
" with a handful of vim plugins. 
"
" @IMPORTANT: This file MUST be sourced before `plugged.vim`

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
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mbbill/undotree'
Plug 'nordtheme/vim'
Plug 'preservim/tagbar'
Plug 'preservim/vimux'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui' "Optional
Plug 'kristijanhusak/vim-dadbod-completion'

"Plug 'ycm-core/YouCompleteMe'
"Plug 'neanias/everforest-nvim'

"function! BuildYCM(info)
  " @TODO
  " install OS dependencies
  "silent ! sudo apt upgrade -y 
  "silent ! sudo apt install cmake
  "if a:info.status == 'installed' || a:info.force
    " !./install.py"
  " endif
  " endfunction
"Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }


"" Experimental

" wilder.nvim
"Plug 'gelguy/wilder.nvim'
"  wilder.nvim dependencies
"  allows use of Python remote plugin features in Vim, can be skipped

call plug#end()


" auto install plugins
"" system() capture shell command output as vimscript variable
"" execute() runs Command Mode command in vimscript
let dir_count = trim(system('find ' . expand('$HOME/.vim/plugged') . ' -type d | wc -l'))
"echo dir_count
if dir_count < 5
    echo "Running intial vim-plug install"
    execute("silent! PlugInstall")
    " below simulates hitting <Enter> for Command Mode prompt
    execute "normal! \<CR>"
    execute "q"
    "echo \"Done with auto install"
endif

