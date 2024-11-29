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

-- Normal/Command mode switch
remapp("n", "<Leader>;", ":", {silent = false} ) --  dont pass "opts" b/c we want to see CMD prompt
remapp("n", ";;", ":", {silent = false} ) -- opts)

-- Normal/Insert mode switch
remapp("n", "<Leader>,", "i", opts)
remapp("n", "<Leader>jj", "i", opts)  -- @experimental
remapp("n", ",,", "i", opts)  -- @experimental

-- toggle search highlighting
remapp('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)


-- @experimental
-- quickfix navigation
remapp('n', '<leader>qo', 'copen', {silent = false})
remapp('n', '<leader>qc', 'cclose', {silent = false})
remapp('n', '<leader>qn', 'cnext', {silent = false})
remapp('n', '<leader>qp', 'cprev', {silent = false})


-- easier saving/exiting
remapp('n', '<leader>w', ':w<Cr>', opts)
remapp('n', '<leader>leader>w', ':w!<Cr>', opts)
remapp('n', '<leader>x', ':q<Cr>', opts)
remapp('n', '<leader><leader>x', ':q!<Cr>', opts)  -- DONT overwrite 'qq' (start macro recording)

-- if possible, create new vert window from current file
vim.keymap.set('n', '<C-n>', function()
  local current_file = vim.fn.expand('%:t')  -- get current file name
  if current_file == '' then
    vim.cmd('vnew')  -- create vert split w/ new unnamed buffer
  else
    vim.cmd('vnew ' .. current_file)  -- create vert split w/ current file name
  end
end, { noremap = true, silent = true })


-- <Leader>r Redo change 
remapp('n', '<leader>r', '<C-r>', {noremap = true})

-- add description later
--
-- @kickstarter
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Normal/Terminal
remapp('n', '<Leader>t', ':terminal<Cr>iclear<CR>', {noremap = true })

-- Normal/Visual
remapp("n", "<leader>v","v", {noremap = true})

-- Normal/Visual Line
remapp("n", "<leader><leader>v","<S-v>", {noremap = true})


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

-- mirror tmux Visual/Copy mode keybinds
-- switch to normal mode/kill current selection
remapp("v", "<leader>.","<C-c>", {noremap = true})
remapp("v", "..","<C-c>", {noremap = true})
--remapp("v", ",,","<C-c>", {noremap = true})


-- @experimental
-- visual mode copy alt.
remapp("v", "//", "y", {noremap = true})

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

-- @TODO 
-- Find way to simluate another <CR> after Neovim ends the terminal process.
-- Tried adding second <CR> but it didnt work (guessing its b/c of some Operator pending thing).
vim.keymap.set('t', '<C-x>', '<C-c> exit<CR>', { desc = 'Exit terminal mode' })

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


