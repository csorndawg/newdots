-- NVIM OPTIONS CONFIG 
-- 
-- @TODO: View kickstarter (kickstart.nvim/lua/options.lua), LunarVim, 
-- vimrc (needs lua translation), etc. for ideas and add to below.
--

-- some test/example opts 
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = ''  -- turn mouse off
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.scrolloff = 4 -- Lines of context
vim.opt.scrolloff = 10
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
