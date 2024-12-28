" Core VIM Remaps


"" SENSIBLE
"" -----------

nnoremap <Leader>w :write<CR>
nnoremap <Leader>ww :write!<CR>
nnoremap <Leader>x :q<CR>
nnoremap <Leader>xx :q!<CR>
nnoremap <C-x> :qa!<CR>
"nnoremap <Leader>q :q<CR>

"" Better Movement/Scrolling
"" ------------------------------

"move to cursor to middle of screen with `<space><space>m`
nnoremap <Leader><Leader>m M 
nnoremap <Leader><Leader>h H 
nnoremap <Leader><Leader>l L 


" smoother buffer navi
nnoremap <S-l> :bn<Cr>
nnoremap <S-h> :bp<Cr>
nnoremap <leader>bd :bd<Cr>

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
"cnoremap <Alt-h> <kHome>
"cnoremap <Alt-h> <Home>
"cnoremap hh <Home>
"cnoremap ee <End>
cnoremap <F7> <kEnd>
cnoremap <F8> <End>
"cnoremap <Alt-e> <kEnd>
"cnoremap <Alt-h> <Home>

" @ TODO - Remap <C-Arrow Key> to its vim movement equivalent. Eg. map 
" FORWARD WORD (<C-Right Arrow>) to <C-w> in command mode. Using Up/Down for 
" beginning/end of line movements.
cnoremap <C-w> <C-Right>
cnoremap <C-b> <C-Left>
cnoremap <C-k> <kEnd>
cnoremap <C-j> <kHome>

" Remap command mode history cycling
" <Ctrl>, to cycle through history 
" <Ctrl>. to reverse (back) cycle
cnoremap <C-,> <Up>
cnoremap <C-.> <Down>

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


" run (p)ython/(b)ash buffer
nnoremap <leader>rp :w !python3 %<Tab><Cr>
nnoremap <leader>rb :w !bash %<Tab><Cr>

" @TODO: Add remaps to NVIM config
"" cmd mode line navigation
cnoremap hh <Left>
cnoremap ll <Right>
cnoremap ee <C-Right>
cnoremap bb <C-Left>
cnoremap <Leader>0 <Home>
cnoremap <Leader>4 <End>

"" cmd mode char editing
cnoremap <Leader>x <Delete>
cnoremap <A-x> <Delete>


" @TODO
" Switch Normal Mode logic b/w ',' and ':' keys 
"   - Goal: ';/:' can be used to cycle fF/tT matches
"
" store original functionality of ':' mapping in ':::'
"nnoremap ,,, ,
"nnoremap ::: :
"nmap : ,


"" terminal mode
nnoremap <Leader>t :vertical terminal<Cr>

nnoremap <leader><leader>x :q!<cr>
nnoremap <leader>p :set paste<cr>
nnoremap <leader>pp :set nopaste<r>

" bash/python bulk comment all selected text with <Leader>c
vnoremap <Leader>c :s/^[0-z]/# &/<CR>

"" bash/python bulk uncomment all selected commented text w/ <Leader>u
vnoremap <silent> <Leader>u :s/^# //<CR>
"vnoremap <silent> <Leader>cc :s/^# //<CR>
