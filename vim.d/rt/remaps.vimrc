"" from previous vimrc

" decrease leader timeout latency (default 1000 ms)
set timeoutlen=500

" remap leader to <space>
let mapleader= " "

" backslash '/' and commas ',' remap to leader
nmap <bslash> <space>
nmap , <space>

" tmux-like commands for better window navigation remaps 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>, <C-w>w

" more tmux-like behavior: tmux-like window resizing

" zoom fullscreen for current split
nnoremap <leader><C-z> <C-w>o

" normal-insert mode remaps
inoremap <leader>,, <ESC>
nnoremap <leader>,, i

" enter command mode with <Space>..
nnoremap <leader>; :
nnoremap <leader>cmd :


" leave command mode with <Ctrl-z>
cnoremap <C-z> <ESC><cr>

" paste toggle
nnoremap <leader>pp :set paste<CR>
nnoremap <leader>ppp :set nopaste<CR>

" disable mouse
"set mouse=
" extend mouse selection instead of showing popup mouse menu
 set mousemodel=extend


"" NEW 

" take open help.txt file and push it to a tab
nnoremap <leader>zm <C-w>T
cnoremap <leader>zm windcmd T<cr>

" run file dirty remap
nnoremap <leader>xx :! bash %  <cr>
nnoremap <leader>rf :! python % <cr>


