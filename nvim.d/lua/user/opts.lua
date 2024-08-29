-- "vim.cmd" style configurations
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set showmatch")
--vim.cmd("set wildmenu=true")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set hidden")


-- persistent undos 
vim.cmd("set noswapfile")
vim.opt.undofile = true
vim.opt.backup = false

-- "vim.opt" style configurations
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true 
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.expandtab = true -- expand tabs
vim.opt.smartindent = true -- indents smart
