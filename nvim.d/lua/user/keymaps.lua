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
local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true, silent = false }
local term_opts = { silent = true }
local remapp = vim.api.nvim_set_keymap -- shorten NVIM remap function call

--
-- Normal Mode
--

-- remap Ff/Tt cycling to <Left/Right> arrows
remapp("n", "<Right>", ";", opts)
remapp("n", "<Left>", ", ", opts)

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
remapp("n", "<Leader>bd", ":bd<CR>", opts)
remapp("n", "<Leader>b", ":buffers<CR>", opts)

-- move text up and down w/ <ALT-j><ALT-j>/<ALT-k><ALT-k>
--remapp("n", "<A-j>", ":m .+1<CR>==", opts)
--remapp("n", "<A-k>", ":m .-2<CR>==", opts)
--
-- (m)ove text up/down
remapp("n", "mj", ":m .+1<CR>==", opts)
remapp("n", "mk", ":m .-2<CR>==", opts)

-- @TODO: review NVIM docs to see if existing mapping exists for other Normal
-- Mode like actions within Insert Mode (ex. delete current word, but stay
-- in Insert mode whole time)
--
-- insert mode arrow key cursor navigation
remapp("i", "<A-h>", "<Left>", opts)
remapp("i", "<A-l>", "<Right>", opts)
remapp("i", "<A-k>", "<Up>", opts)
remapp("i", "<A-j>", "<Down>", opts)

-- @FIXME: Broken keymap. Use <Right> as 'next' fFtT match
-- Restore original find-repeat behavior BEFORE swapping ";"
vim.keymap.set("n", "<A-;>", ";", { noremap = true }) -- Use Alt+; to repeat f/t
--vim.keymap.set("n", "<A-:>", ":", { noremap = true }) -- Optional: Alt+: for command mode

-- Now swap ";" and ":"
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

-- Normal/Insert mode switch 	(Cycle b/w two modes with `,,`)
remapp("n", "<Leader>,", "i", opts)
remapp("n", "<C-,>", "i", opts)

-- toggle search highlighting
remapp("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- @experimental
-- quickfix navigation
remapp("n", "<leader>qo", "copen", { silent = false })
remapp("n", "<leader>qc", "cclose", { silent = false })
remapp("n", "<leader>qn", "cnext", { silent = false })
remapp("n", "<leader>qp", "cprev", { silent = false })

-- easier saving/exiting
remapp("n", "<leader>w", ":w<Cr>", opts)
remapp("n", "<leader>ww", ":w!<Cr>", opts)
remapp("n", "<leader>ex", ":q<Cr>", opts)
remapp("n", "<leader>ex!", ":q!<Cr>", opts)

-- if possible, create new vert window from current file
vim.keymap.set("n", "<C-n>", function()
	local current_file = vim.fn.expand("%:t") -- get current file name
	if current_file == "" then
		vim.cmd("vnew") -- create vert split w/ new unnamed buffer
	else
		vim.cmd("vnew " .. current_file) -- create vert split w/ current file name
	end
end, { noremap = true, silent = true })

-- @kickstarter
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Normal/Terminal
remapp("n", "<Leader>t", ":terminal<Cr>iclear<CR>", { noremap = true })

-- Normal/Visual
remapp("n", "<leader>v", "v", { noremap = true })

-- Normal/Visual Line
remapp("n", "<leader><leader>v", "<S-v>", { noremap = true })

-- Cursor Movement within current screen
remapp("n", "<leader><leader>h", "H", { silent = true })
remapp("n", "<leader><leader>m", "M", { silent = true })
remapp("n", "<leader><leader>l:", "L", { silent = true })

-- undo/redo
remapp("n", "<leader>u", "<C-u>", opts)
remapp("n", "<leader>r", "<C-r>", { noremap = true })

-- show path of current file
remapp("n", "<Leader>ep", ":echo expand('%')<Cr>", { noremap = true })

-- add description later
-- run (p)ython/(b)ash buffer
remapp("n", "<leader>rp", ":w !python3 %<Tab><Cr>", { noremap = true })
remapp("n", "<leader>rl", ":w !lua %<Tab><Cr>", { noremap = true })
remapp("n", "<leader>rb", ":w !bash  %<Tab><Cr>", opts)

--
-- Insert Mode
--

-- Insert/Normal mode swtich
remapp("i", ",,", "<ESC>", opts)
remapp("i", "<Ctrl-,", "<ESC>", opts)
remapp("i", "jj", "<ESC>", opts)
remapp("i", "kk", "<ESC>", opts)
remapp("i", "ii", "<ESC>", opts)

-- Insert/Command mode switch
--remapp("i", ";;", "<ESC>:", opts_loud) -- dont pass opts b/c we want to see CMD prompt
remapp("i", "<C-;>", "<ESC>:", opts_loud)

-- Normal/Insert Mode
remapp("n", "<leader>,,", "i<Tab>", opts)

-- <Alt-,> simulates <TAB> key
remapp("i", "<A-,>", "<Tab>", opts)

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
remapp("v", "<leader>.", "<C-c>", { noremap = true })

-- Tmux-like remap for entering/exiting visual block/copy mode
remapp("n", "<C-.>", "<C-v>", { noremap = true })
remapp("v", "<C-.>", "<C-c>", { noremap = true })
remapp("v", "<C-/>", "y", { noremap = true })
--remapp("v", ",,","<C-c>", {noremap = true})

-- @experimental
-- visual mode copy alt.
remapp("v", "//", "y", { noremap = true })
--remapp("v", ",,", "y", { noremap = true })
remapp("v", "<leader>c", "y", { noremap = true })

-- easier pasting
remapp("n", "<Alt-v>", "p", { noremap = true })

-- 'x' deletes visual selection
remapp("v", "x", "d", { noremap = true })

-- easier switch from Visual to Normal
remapp("v", "<leader><leader>", "<C-c>", opts)
remapp("v", "<leader>n", "<C-c>", opts)

--
-- Visual Block Mode
--

-- Move text up and down
remapp("x", "J", ":m '>+1<CR>gv=gv", opts)
remapp("x", "K", ":m '<-2<CR>gv=gv", opts)
remapp("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
remapp("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- rerun last CMD command
remapp("n", "<Leader><Up>", ":<Up><CR>", opts)

--
-- Terminal Mode
--

-- better terminal navigation
--- remapp("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- remapp("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- remapp("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- remapp("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--
-- Command Mode
--

-- command/normal mode switch
--remapp("c", ";;", "<Esc>", opts)
remapp("c", "<C-;>", "<Esc>", opts)

-- command/insert mode switch  (continue with comma `,` theme remaps linked with Insert Mode)
remapp("c", "<A-,>", "<Esc>i", opts)
remapp("c", ",,", "<Esc>i", opts)

-- @TODO - Try out <CTRL><key> vs. <key><key> movement remaps, and pick one method
-- to keep moving forward and remove other method after to free up binding.
-- CMD mode command line cursor movement remaps

-- <key><key> CMD movement remaps
remapp("c", "HH", "<Home>", { noremap = true })
remapp("c", "EE", "<End>", { noremap = true })
remapp("c", "bb", "<C-Left>", { noremap = true })
remapp("c", "ww", "<C-Right>", { noremap = true })
remapp("c", "hh", "<Left>", { noremap = true })
remapp("c", "lll", "<Right>", { noremap = true })

-- CMD history cycling remaps
remapp("c", "<C-,>", "<Up>", { noremap = true })
remapp("c", "<C-.>", "<Down>", { noremap = true })

-- <Ctrl><key> CMD movement remaps
--remapp("c", "<C-l>", <Right>, {noremap = true})
--remapp("c", "<C-b>", <C-Left>, {noremap = true})
--remapp("c", "<C-w>", <C-Right>, {noremap = true})
--remapp("c", "<C-b>", <C-Right>, {noremap = true})
--remapp("c", "ww", <C-Right>, {noremap = true})
---- remap <Ctrl-h> (delete previous key) to new keymap before overwriting
--remapp("c", "<C-x>", <C-h>, {noremap = true})
--remapp("c", "<C-h>", <Left>, {noremap = true})

--
-- Experimental Remaps
--

-- simple navigation/movements while staying in Insert Mode
remapp("i", "<A-l><A-l>", "<Right>", { noremap = true })
remapp("i", "<A-h><A-h>", "<Left>", opts)
remapp("i", "<A-k><A-k>", "<Up>", opts)
remapp("i", "<A-j><A-j>", "<Down>", opts)

-- <Ctrl-l><Ctrl-l> for omni line completion
vim.keymap.set("i", "<C-l><C-l>", "<C-x><C-l>", { desc = "Line comp", noremap = true })
vim.keymap.set("i", "<C-f><C-f>", "<C-x><C-f>", { desc = "Path comp", noremap = true })

-- rerun last CMD mode command in normal/on visual block selection with <Leader>cx
-- `:@:` recalls and executes the most recent `:` command
vim.keymap.set({ "n", "v" }, "<Up><Up>", ":@:<Cr>", { silent = true, silent = true, desc = "Rerun last CMD command" })

-- @TODO: Better Cursor Movement/Workflow
-- For default movement mappings see: https://learnvim.irian.to/basics/moving_in_file#scrolling

-- scroll halfway up/down with <Ctrl-j/k>
-- @NEXT: expand mapping to visual mode (see <Up><Up> example above for ref)
-- @IDEA: make <Leader>m --> "Movement" group for cursor/scrolling remaps

-- simpler scrolling workflow (@TEST:)
vim.keymap.set("n", "<A-k>", "<C-u>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-d>", { noremap = true, silent = true })

-- move cursor right with <Ctrl-Space> within insert
vim.keymap.set("i", "<C-Space><C-Space>", "<Right>", { noremap = true, silent = true })

--  move cursor left with <Ctrl-h><Ctrl-h> or <Ctrl-BS><Ctrl-BS> as vim
-- natively maps <C-h> to <Bs>
vim.keymap.set("i", "<C-h><C-h>", "<Left>", { noremap = true, silent = true })

-- move cursor to start/end of line shortcuts
vim.keymap.set("i", "00", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "$$", "<End>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>no", "<cmd>set nornu nonu <cr>", { desc = "Disable line numbers" })
vim.keymap.set("n", "<leader>ne", "<cmd>set rnu nu <cr>", { desc = "Enable line numbers" })

vim.keymap.set("n", "<Leader>bn", ":bn", { desc = "Buffer next", noremap = true })
vim.keymap.set("n", "<Leader>bp", ":bp", { desc = "Buffer prev", noremap = true })

-- @EXPERIMENTAL: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
local map = vim.keymap.set
map("n", "<C-a><C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- @EXPERIMENTAL: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/keymaps.lua
-- <lunarvim remap copypasta>

-- @EXPERIMENTAL: https://github.com/dam9000/kickstart-modular.nvim/blob/master/lua/keymaps.lua
-- <kickstart remap copypasta>

-- @EXPERIMENTAL: Custom remaps to trial
-- <my custom remap copypasta>
