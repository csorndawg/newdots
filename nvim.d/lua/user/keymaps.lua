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

-- better window navigation
-- remapp("n", "<C-h><C-h>", "<C-w>h", opts)
-- remapp("n", "<C-j><C-j>", "<C-w>j", opts)
-- remapp("n", "<C-k><C-k>", "<C-w>k", opts)
-- remapp("n", "<C-l><C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-w><C-w>", "<C-w>w", { desc = "Cycle splits", silent = true, noremap = true })

-- resize with arrows
remapp("n", "<S-Up>", ":resize -2<CR>", opts)
remapp("n", "<S-Down>", ":resize +2<CR>", opts)
remapp("n", "<S-Left>", ":vertical resize -2<CR>", opts)
remapp("n", "<S-Right>", ":vertical resize +2<CR>", opts)

--
-- (m)ove text up/down
remapp("n", "mj", ":m .+1<CR>==", opts)
remapp("n", "mk", ":m .-2<CR>==", opts)

-- Now swap ";" and ":"
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

-- Normal/Insert mode switch 	(Cycle b/w two modes with `,,`)
remapp("n", "<Leader>,", "i", opts)
remapp("n", ",,", "i", opts)

-- toggle search highlighting
remapp("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- @experimental
-- quickfix navigation
remapp("n", "<leader>Qo", "copen", { desc = "Open quicklist", silent = false })
remapp("n", "<leader>Qc", "cclose", { desc = "Close quicklist", silent = false })
remapp("n", "<leader>Qn", "cnext", { desc = "Next quicklist", silent = false })
remapp("n", "<leader>Qp", "cprev", { desc = "Prev quiclist", silent = false })

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
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Cursor Movement within current screen
remapp("n", "<leader><leader>h", "H", { desc = "Move cursor to top", silent = true })
remapp("n", "<leader><leader>m", "M", { desc = "Move cursor to middle", silent = true })
remapp("n", "<leader><leader>l", "L", { desc = "Move cursor to bottom", silent = true })

-- show path of current file
remapp("n", "<Leader>ep", ":echo expand('%')<Cr>", { desc = "Echo path", noremap = true })

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
-- Normal/Insert Mode
-- remapp("n", "<leader>,,", "i<Tab>", opts)

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
-- remapp("n", "<C-.>", "<C-v>", { noremap = true })
-- remapp("v", "<C-.>", "<C-c>", { noremap = true })
-- remapp("v", "<C-/>", "y", { noremap = true })
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

-- @FIXME: not sure what this does/ if its broken (taken from nvim distro)
-- Move text up and down
-- remapp("i", "<S-Down>", ":m '>+1<CR>gv=gv", opts)
-- remapp("i", "<S-Up>", ":m '<-2<CR>gv=gv", opts)

-- rerun last CMD command
remapp("n", "<Leader><Up>", ":<Up><CR>", opts)

--
-- Terminal Mode
--

-- Command Mode
--

-- command/normal mode switch
--remapp("c", ";;", "<Esc>", opts)
remapp("c", ";;", "<Esc>", opts)

-- command/insert mode switch  (continue with comma `,` theme remaps linked with Insert Mode)
remapp("c", ",,", "<Esc>i", opts)

--
-- Experimental Remaps
--

-- simple navigation/movements while staying in Insert Mode
vim.keymap.set("i", "<C-h>", "<Left>", { silent = true, noremap = true }) --- move cursor left 1 char
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true, noremap = true }) -- move cursor down 1 line
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true, noremap = true }) -- move cursor down 1 line
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true, noremap = true }) -- move cursor right 1 char

-- delete and move cursor
vim.keymap.set("i", "<C-S-h>", "<BS>", { silent = true, noremap = true })
vim.keymap.set("i", "<A-h>", "<BS>", { silent = true, noremap = true }) -- delete previous char (ie. <Backspace>)
vim.keymap.set("i", "<A-l>", "<Del>", { silent = true, noremap = true }) -- delete next char (ie. <Delete> key behavior)

-- <Ctrl-l><Ctrl-l> for omni line completion
-- vim.keymap.set("i", "<C-l><C-l>", "<C-x><C-l>", { desc = "Line comp", noremap = true })
-- vim.keymap.set("i", "<C-f><C-f>", "<C-x><C-f>", { desc = "Path comp", noremap = true })

-- rerun last CMD mode command in normal/on visual block selection with <Leader>cx
-- `:@:` recalls and executes the most recent `:` command
vim.keymap.set({ "n", "v" }, "<Up><Up>", ":@:<Cr>", { silent = true, noremap = true, desc = "Rerun last CMD command" })

vim.keymap.set("n", "<A-k>", "<C-u>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-d>", { noremap = true, silent = true })

-- move cursor right with <Ctrl-Space> within insert
vim.keymap.set("i", "<C-Space><C-Space>", "<Right>", { noremap = true, silent = true })

-- move cursor to start/end of line shortcuts
vim.keymap.set("i", "00", "<Home>", { noremap = true, silent = true })
vim.keymap.set("i", "$$", "<End>", { noremap = true, silent = true })

-- @EXPERIMENTAL: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
-- local map = vim.keymap.set
vim.keymap.set("n", "<C-a><C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })

-- Lazy Vim
-- Terminal Mappings
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", noremap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", noremap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", noremap = true })

-- @TESTME: Test below keymaps 4/26
vim.keymap.set("i", "<A-Right>", "<Tab>", { silent = true })
vim.keymap.set("i", "<A-Left>", "<BS><BS>", { silent = true }) -- assumes <Tab>=2 spaces

-- buffer cycling
-- vim.keymap.set("n", "<C-.>", "<cmd>bn<cr>", { desc = "Buffer next", noremap = true, silent = true })
-- vim.keymap.set("n", "<C-,>,", "<cmd>bp<cr>", { desc = "Buffer prev", noremap = true, silent = true })

-- [m]isc sublabel remaps
vim.keymap.set("n", "<leader>ms", "<cmd>set signcolumn=no<CR>", { silent = true, desc = "Disable sign column" })
vim.keymap.set("n", "<leader>mS", "<cmd>set signcolumn=auto<CR>", { silent = true, desc = "Enable sign column" })

-- toggle line numbers on/off
vim.keymap.set(
	"n",
	"<leader>ml",
	"<cmd>set norelativenumber nonumber <Cr>",
	{ silent = true, desc = "Toggle line numbers off" }
)
vim.keymap.set(
	"n",
	"<leader>mL",
	"<cmd>set relativenumber number <Cr>",
	{ silent = true, desc = "Toggle line numbers on" }
)

-- toggle fold column on/off
vim.keymap.set("n", "<leader>mf", "<cmd>set foldcolumn=0<Cr>", { silent = true, desc = "Toggle fold column off" })
vim.keymap.set("n", "<leader>mF", "<cmd>set foldcolumn=1<Cr>", { silent = true, desc = "Toggle fold column on" })

-- paste toggling
vim.keymap.set("n", "<leader>mp", "<cmd>set paste<cr>", { desc = "Paste on", silent = false })
vim.keymap.set("n", "<leader>mP", "<cmd>set nopaste<cr>", { desc = "Paste off", silent = false })

-- map("n", "<leader>X", "<cmd>wq!<CR>", opts) -- Save and quit forcefully

-- quickfix navigation
vim.keymap.set("n", "<leader>qo", "<cmd>copen <cr>", { desc = "Open quicklist", silent = false })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose <cr>", { desc = "Close quicklist", silent = false })
vim.keymap.set("n", "<leader>qn", "<cmd>cnext <cr>", { desc = "Next quickfix list", silent = false })
vim.keymap.set("n", "<leader>qp", "<cmd>cprev <cr>", { desc = "Prev quickfix list", silent = false })
vim.keymap.set(
	"n",
	"<leader>qp",
	"<cmd>lua vim.fn.setqflist({}, 'f')<cr>",
	{ desc = "Clear current quickfix list", silent = false }
)

-- @TODO: Look to mirror code below to create additional Cmd-mode keybinds for removing/adding text.

-- custom function to have "<C-w>" behave like emacs keybinding in Command mode
-- and delete from cursor to beginning of word
vim.keymap.set("c", "<C-w>", function()
	-- get the current command-line text and cursor position
	local line = vim.fn.getcmdline()
	local pos = vim.fn.getcmdpos()

	-- if we're at the start, do nothing
	if pos <= 1 then
		return ""
	end

	-- get text before cursor
	local before = line:sub(1, pos - 1)
	local after = line:sub(pos)

	-- remove from cursor to beginning of previous word
	-- this matches the last "word" (alphanumeric/underscore) before cursor
	before = before:gsub("[^%w_]*[%w_]+$", "")

	-- move cursor to new position and return updated command line
	vim.fn.setcmdline(before .. after)
	vim.fn.setcmdpos(#before + 1)
	return ""
end, { expr = true })

-- compliment of above function
-- in Cmd-mode "<C-f>" removes text from cursor to end of word
vim.keymap.set("c", "<C-f>", function()
	local line = vim.fn.getcmdline()
	local pos = vim.fn.getcmdpos()

	local before = line:sub(1, pos - 1)
	local after = line:sub(pos)

	-- Remove from cursor to end of word (alphanumeric/underscore characters)
	after = after:gsub("^[%w_]+", "")

	vim.fn.setcmdline(before .. after)
	vim.fn.setcmdpos(#before + 1)
	return ""
end, { expr = true })

-- move cursor in Insert/Command mode wth <Ctrl-Backspace>/<Ctrl-Shift-Backspace>

-- @EXPERIMENTAL: Testing alternative/simpler <ESC> keymap
vim.keymap.set({ "v", "n", "c", "i" }, "<Leader><Leader>c", "<Esc>", { noremap = true })
vim.keymap.set({ "v", "n", "c", "i" }, "<C-_><C-_>", "<Esc>", { noremap = true })

-- buffer cycling all modes
vim.keymap.set({ "v", "n", "c", "i" }, "<C-Home>", "<Esc><cmd>bn<cr>", { noremap = true })
vim.keymap.set({ "v", "n", "c", "i" }, "<C-End>", "<Esc><cmd>bn<cr>", { noremap = true })

vim.keymap.set("v", "<Leader>vs", ":sort<cr>", { noremap = true, desc = "Sort visual selection" })
