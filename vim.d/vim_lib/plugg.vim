" VIM Plugin Remaps 
"
" @DEPENDENCIES: `plug.vim`
" @IMPORTANT: This file must be sourced AFTER its dependencies

" view undotree

"" ------------------------------------------------
"" vim-which-key
"" ------------------------------------------------

"let g:mapleader = "\<Space>"
"let g:maplocalleader = ','
"nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" after 500 ms `which-key` map is shown (vim stops waiting for remap
" sequence after 500 ms, which triggers the which-key map display)
set timeoutlen=500


" Create separate which-key <SPACE> dictionaries for Normal/Visual Modes
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map", 'n')
call which_key#register('<Space>', "g:which_key_map_visual", 'v')


" DOC EXAMPLES
"
" Which-Key Dictionary
" Warning below mappings are untested, and might not work b/c they are 
" being overwritten by other VIMRC code.
let g:which_key_map = {}
let g:which_key_map['W'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }
call which_key#register('<Space>', "g:which_key_map")

" Ignore/Hide mapping samples
"" Hide Top Level Mapping 
nnoremap <leader>1 :1wincmd w<CR>
let g:which_key_map.1 = 'which_key_ignore'

"" Hide Nested Level Mapping Example
"" create nested remaps '<leader>_a' and '<leader>_b'
nnoremap <leader>_a :echom '_a'<CR>
nnoremap <leader>_b :echom '_b'<CR>
"" Instruct which-key to ignore the Nested Level Mappings defined above
let g:which_key_map['_'] = { 'name': 'which_key_ignore' }


" @TODO: Review and experiment w/ skeleton code from doc
" ************************************************************************************
"" Define Custom Which-Key Dictionaries (include existing, new keymaps)
" ************************************************************************************

"" Define prefix dictionary
"let g:which_key_map =  {}
"
"" Second level dictionaries:
"" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
"" Unnamed groups will show a default empty string.
"
"" =======================================================
"" Create menus based on existing mappings
"" =======================================================
"" You can pass a descriptive text to an existing mapping.
"
"let g:which_key_map.f = { 'name' : '+file' }
"
"nnoremap <silent> <leader>fs :update<CR>
"let g:which_key_map.f.s = 'save-file'
"
"nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
"let g:which_key_map.f.d = 'open-vimrc'
"
"nnoremap <silent> <leader>oq  :copen<CR>
"nnoremap <silent> <leader>ol  :lopen<CR>
"let g:which_key_map.o = {
"      \ 'name' : '+open',
"      \ 'q' : 'open-quickfix'    ,
"      \ 'l' : 'open-locationlist',
"      \ }
"
"" =======================================================
"" Create menus not based on existing mappings:
"" =======================================================
"" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
"" and descriptions for the existing mappings.
""
"" Note:
"" Some complicated ex-cmd may not work as expected since they'll be
"" feed into `feedkeys()`, in which case you have to define a decicated
"" Command or function wrapper to make it work with vim-which-key.
"" Ref issue #126, #133 etc.
"let g:which_key_map.b = {
"      \ 'name' : '+buffer' ,
"      \ '1' : ['b1'        , 'buffer 1']        ,
"      \ '2' : ['b2'        , 'buffer 2']        ,
"      \ 'd' : ['bd'        , 'delete-buffer']   ,
"      \ 'f' : ['bfirst'    , 'first-buffer']    ,
"      \ 'h' : ['Startify'  , 'home-buffer']     ,
"      \ 'l' : ['blast'     , 'last-buffer']     ,
"      \ 'n' : ['bnext'     , 'next-buffer']     ,
"      \ 'p' : ['bprevious' , 'previous-buffer'] ,
"      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
"      \ }
"
"let g:which_key_map.l = {
"      \ 'name' : '+lsp',
"      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
"      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
"      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
"      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
"      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
"      \ 'g' : {
"        \ 'name': '+goto',
"        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
"        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
"        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
"        \ },
"call which_key#register('<Space>', '"g:which_key_map")


"" ------------------------------------------------
"" vim-dadbod
"" ------------------------------------------------
let g:vim_dadbod_completion_lowercase_keywords = 1

" Built in omnifunc completion
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
