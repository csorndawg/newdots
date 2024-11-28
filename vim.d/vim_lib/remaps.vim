" Core VIM Remaps


"" SENSIBLE
"" -----------

nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>
nnoremap <Leader>q :q<CR>

"" Better Movement/Scrolling
"" ------------------------------

"move to cursor to middle of screen with `<space><space>m`
nnoremap <Leader><Leader>m M 


" smoother buffer navi
nnoremap <leader>l :bn<Cr>
nnoremap <leader>h :bp<Cr>

"  tmux-like commands for better window navigation remaps (change to mirror tmux)
nnoremap <C-h> <C-w>h      
nnoremap <C-j> <C-w>j      
nnoremap <C-k> <C-w>k      
nnoremap <C-l> <C-w>l      


"" UNDO/REDO
"" -----------

" Normal Mode Undo/Redo
nnoremap <Leader>r <C-r>
noremap <leader>u <C-u>

" Insert Mode Undo/Redo
"inoremap <Alt-u> <C-G>u<C-U>
"inoremap <Alt-r> <C-G>u<C-R>
"inoremap <Alt-r> <C-R>
"inoremap <Leader><Leader>r <C-R>
inoremap <C-u> <C-G>u<C-U>
inoremap <C-r> <C-G>u<C-R>


" Undo/Redo Extras
"noremap <leader><leader>u :UndotreeShow<CR>
noremap <leader>uu :UndotreeShow<CR>


"" <MISC>
"" -----------

" @REMAP
cnoremap terminal vert terminal<CR>

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader>lb <C-^>

" close all buffers except current 
nnoremap <Leader>o :only<CR>

" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <Leader>ep :echo expand('%')<CR>


" <Alt> h/e moves Cmd cursor to start/end of cmdline
cnoremap <Alt-h> <kHome>
cnoremap <Alt-e> <kEnd>
"cnoremap <Alt-h> <Home>

" @TODO - Move to first word in cmdline command. Repeat logic for last word as
" well. Intended use cases: appending '!' to cmd (first word); changing 
" filename in an absolute path (last word)
"cnoremap <Alt-h> <Home>

" @NOTES - PageUp/PageDown work in both Normal AND Insert mode. If binding 
" doesnt work as expected, try <kPageUp>/<kPageDown>.
" remap scroll up/down via <PageUp/PageDown> to something easier/less awkward


" insert line navigation
inoremap <C-k> <up> 
inoremap <C-j> <down> 
inoremap <C-h> <left> 
inoremap <C-l> <right> 
inoremap <Alt-k> <PageUp>
inoremap <Alt-j> <PageDown>

" Normal scrolling 
" Default Maps
"     <Ctrl-f><Ctrl-b> scroll down/up full page 
"     <Ctrl-d><Ctrl-u> scroll down/up 1/2 page 
"
nnoremap <leader>J <Ctrl-f>
nnoremap <leader>K <Ctrl-b>
nnoremap <leader>jj <Ctrl-d>
nnoremap <leader>kk <Ctrl-u>

