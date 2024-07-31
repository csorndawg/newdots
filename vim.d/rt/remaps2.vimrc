"" REMAP-ISH THINGS

" decrease leader timeout latency (default 1000 ms)
set timeoutlen=500
" 
" remap leader to <space>  
let mapleader= " "

" backslash '/' and commas ',' remap to leader 
nmap <bslash> <space>
nmap , <space>

"  tmux-like commands for better window navigation remaps (change to mirror tmux)
nnoremap <C-h> <C-w>h      
nnoremap <C-j> <C-w>j      
nnoremap <C-k> <C-w>k      
nnoremap <C-l> <C-w>l      
nnoremap <leader>, <C-w>w

" normal-insert mode remaps
inoremap <leader>,, <ESC>
nnoremap <leader>,, i

" enter command mode with <Space>;
nnoremap <leader>; :
" leave command mode with <Ctrl-z>
cnoremap <C-z> <ESC>

