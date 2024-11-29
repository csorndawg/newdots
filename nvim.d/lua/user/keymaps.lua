--
-- NVIM CORE REMAPS
--

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Lua Locals 
local opts = { noremap = true, silent = true}
local opts_loud = { noremap = true, silent = false}
local term_opts = { silent = true }
local remapp = vim.api.nvim_set_keymap	-- shorten NVIM remap function call


--
-- Normal Mode 
--

-- better window navigation
remapp("n", "<C-h>", "<C-w>h", opts)
remapp("n", "<C-j>", "<C-w>j", opts)
remapp("n", "<C-k>", "<C-w>k", opts)
remapp("n", "<C-l>", "<C-w>l", opts)


-- resize with arrows
remapp("n", "<C-Up>", ":resize -2<CR>", opts)
remapp("n", "<C-Down>", ":resize +2<CR>", opts)
remapp("n", "<C-Left>", ":vertical resize -2<CR>", opts)
remapp("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffer navigation
remapp("n", "<S-l>", ":bnext<CR>", opts)
remapp("n", "<S-h>", ":bprev<CR>", opts)
remapp("n", "<Leader>bl", ":blast<CR>", opts)
remapp("n", "<Leader>bd", ":blast<CR>", opts)

-- move text up and down w/ <ALT>j/<ALT>k
remapp("n", "<A-j>", ":m .+1<CR>==", opts)
remapp("n", "<A-k>", ":m .-2<CR>==", opts)


-- normal/command mode switch
remapp("n", "<Leader>;", ":", {silent = false} ) --  dont pass "opts" b/c we want to see CMD prompt
remapp("n", ";;", ":", {silent = false} ) -- opts)

-- normal/insert mode switch
-- after some trial time, remove any unused/unhelpful mode switch remaps
--
-- `<SPACE>,` switches from NORMAL to INSERT
-- vim.keymap.set('n', '<leader>,', 'i')
remapp("n", "<Leader>,", "i", opts)
remapp("n", "<Leader>jj", "i", opts)  -- @experimental
remapp("n", ",,", "i", opts)  -- @experimental

-- toggle search highlighting
remapp('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)


-- add description later
remapp('n', '<leader>w', ':w<Cr>', opts)
remapp('n', '<leader>q', ':q<Cr>', opts)
remapp('n', '<leader>qq', ':q!<Cr>', opts)


-- if possible, create new vert window from current file
vim.keymap.set('n', '<C-n>', function()
  local current_file = vim.fn.expand('%:t')  -- get current file name
  if current_file == '' then
    vim.cmd('vnew')  -- create vert split w/ new unnamed buffer
  else
    vim.cmd('vnew ' .. current_file)  -- create vert split w/ current file name
  end
end, { noremap = true, silent = true })


--
-- Insert Mode 
--

-- Insert/Normal mode swtich
remapp("i", ",,", "<ESC>", opts)
remapp("i", "<Alt-,", "<ESC>", opts)

-- delete if rarely being used
remapp("i", "jj", "<ESC>", opts)
remapp("i", "kk", "<ESC>", opts)

-- Insert/Command mode switch
remapp("i",";;", "<ESC>:", opts_loud) -- dont pass opts b/c we want to see CMD prompt
remapp("i","<Alt-;>", "<ESC>:", opts_loud)


--
-- Visual Mode
--

-- stay in indent mode
remapp("v", "<", "<gv^", opts)
remapp("v", ">", ">gv^", opts)

-- move text up and down
remapp("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
remapp("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
remapp("v", "p", '"_dP', opts)


--
-- Visual Block Mode
--

-- Move text up and down
remapp("x", "J", ":m '>+1<CR>gv=gv", opts)
remapp("x", "K", ":m '<-2<CR>gv=gv", opts)
remapp("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
remapp("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)


--
-- Terminal Mode
--

-- better terminal navigation
-- remapp("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- remapp("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- remapp("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- remapp("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


--
-- Command Mode
--

-- command/normal mode switch
remapp("c", ";;", "<Esc>", opts)
remapp("c", "<A-;>", "<Esc>", opts)

-- command/insert mode switch
remapp("c", "<A-,>", "<Esc>i", opts)
remapp("c", ",,", "<Esc>i", opts)
--remapp("c", "<A-;;>", "<Esc>", opts)


--
-- Experimental Remaps
--


