-- make lua read more like vimscript
local set = vim.opt     

-- two equivalent ways to configur history after creating local "set" variable
set.history = 1500
vim.opt.history = 1500


-- ripped from vimrc
set.softtabstop = 2
set.tabstop = 2
set.clipboard = "unnamedplus"
--set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.hidden = true
set.incsearch = true
set.linebreak = true
set.mouse = ""
set.mousem = "extend"
set.pt = "<F5>"
set.rnu = true
set.ruler = true
set.shiftwidth = 2
set.showcmd = true
set.showmatch = true 
set.smarttab = true
set.timeoutlen=400  -- decrease leader timeout latency (default 1000 ms)
set.ttimeoutlen=40  -- decrease latency for key code/command completion (default 50ms)
set.ttimeout = true
set.ttimeoutlen=10
set.wildignore = "*/ignore/*,*.zip,*.ignore,*.tmp"
set.wildmenu = true
set.wildmode = "list:full"
set.wrapscan=true

-- traditional/unaliased way to set options
vim.opt.ls = true
vimp.opt.backspace = "indent,eol,start"

-- automatic syntax detection support ?
--vim.cmd([[
--  filetype plugin indent on
--    syntax on
--    ]])

-- stop auto commenting on next line
set.formatoptions-=cro
