" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" I like using H and L for beginning/end of line
nmap H ^
nmap L $

" Quickly remove search highlights
nmap <F9> :nohl<CR>


" Yank to system clipboard
set clipboard=unnamed


" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>


""
"" SUPPORTED COMMANDS
""

"The plugin skips blank lines and lines starting with Vimscript comments (" ...).
"Special support for yanking to system clipboard can be activated by set clipboard=unnamed (unnamedplus will do the same thing).
"Support for the tabstop Vim option (e.g. set tabstop=4).

"Custom mapping/unmapping commands in addition to the defaults:
"noremap
"iunmap
"nunmap
"vunmap

"exmap [commandName] [command...]: a command to map Ex commands 
"  --> This should basically be supported in regular :map, but doesn't work with multi-argument commands due to a CodeMirror bug, so this is a workaround.
"obcommand - execute Obsidian commands, see more details below.
"cmcommand - execute arbitrary CodeMirror commands, see details below.
"surround - surround your selected text in visual mode or word in normal mode with text.
"pasteinto - paste your current clipboard into your selected text in visual mode or word in normal mode. Useful for creating hyperlinks.
"jscommand and jsfile - extend Vim mode using JavaScript snippets.
"source - loads Vim commands from a file (relative to the vault root).

"Important tip! Before adding commands to your Vimrc file, you should try them in Obsidian's normal mode (type ':' in the editor) to make sure they work as expected. CodeMirror's Vim mode has some limitations and bugs and not all commands will work like you'd expect. In some cases you can find workarounds by experimenting, and the easiest way to do that is by trying interactively rather than via the Vimrc file.

"Finally, this plugin also provides the following motions/mappings by default:
"  [[ and ]] to jump to the previous and next Markdown heading.
"  zk and zj to move up and down while skipping folds.
"  gl and gL to jump to the next and previous link.
"  gf to open the link or file under the cursor (temporarily moving the cursor if necessary—e.g. if it's on the first square bracket of a [[Wikilink]]).
