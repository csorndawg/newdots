-- NVIM OPTIONS CONFIG
--
-- @TODO: View kickstarter (kickstart.nvim/lua/options.lua), LunarVim,
-- vimrc (needs lua translation), etc. for ideas and add to below.
--

-- some test/example opts
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.list = false -- set to 'true' to display
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "" -- turn mouse off
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.scrolloff = 4 -- Lines of context
vim.opt.scrolloff = 5
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent

vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false

-- default spaces/tabs
vim.opt.ts = 2
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.et = true
--
-- Lua Locals
--
local option = vim.opt

--
-- Custom Local Opts
--
vim.api.nvim_set_option("termguicolors", true)

-- case-insensitive search unless \C or search includes multiple capital letters
option.ignorecase = true
option.smartcase = true

-- decrease updatetime (ms)
option.updatetime = 250

-- decrease mapped sequence latency
option.timeoutlen = 300

option.splitright = true
option.splitbelow = true

-- preview substitutions live
option.inccommand = "split"

-- highlight current cursor line
vim.opt.cursorline = true

-- min. number of screen lines above/below cursor
vim.opt.scrolloff = 10

option.breakindent = true
option.undofile = true

-- @TODO
-- Uncomment once I figure out how to exclude Python files (need 4 not 2 spaces)  from below
-- vim: ts=2 sts=2 sw=2 et

-- better CMD wildmenu/mode completion
-- :set wildmode=list:longest,full
vim.opt.wildmode = { "list:longest", "full" }

-- do not show below file types in wildmenu
vim.opt.wildignore = "*.o,*.obj,*.dll,*.exe,*.pyc,*.swp,*node_modules/**,*venv**,*.gig,*.IgnoreMe**,*.patch"
