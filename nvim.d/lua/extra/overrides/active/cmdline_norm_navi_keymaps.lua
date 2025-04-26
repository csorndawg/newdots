-- Keymaps to have some Normal-mode like movements available in Cmd/Ex mode
-- @NOTE: First iteration, might need to retune in future
--
-- local function cmd_map(lhs, rhs)
-- 	vim.api.nvim_set_keymap("c", lhs, rhs, { noremap = true, silent = true })
-- end

-- Word movements
vim.keymap.set("c", "<C-b>", "<C-Left>", { desc = "Move back word (cmdline)" })
vim.keymap.set("c", "<C-f>", "<C-Right>", { desc = "Move forward word (cmdline)" })

-- Line movements
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Move cursor to line start" }) -- @PASSED: Works, but <C-a> needs to be entered 2x to work (because Tmux prefix also is <ctrl-a>)
vim.keymap.set("c", "<, C-e>", "<Home>", { desc = "Move cursor to line end" })

-- Delete to end of command line
-- cmd_map("<C-4>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
-- cmd_map("<Alt-k>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:

-- using <C-.>/<C-.> for single (left/right) cursor movement
-- consistent with vim buffer cycling, spyder cycling, etc.

-- @TESTME: <C-,> to move left 1 char
-- Word movements (stard/end word)
vim.keymap.set("c", "<C-b>", "<C-Left>", { desc = "Move back word (cmdline)" })
vim.keymap.set("c", "<C-f>", "<C-Right>", { desc = "Move forward word (cmdline)" })

-- Line movements
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Move cursor to line start" }) -- @PASSED: Works, but <C-a> needs to be entered 2x to work (because Tmux prefix also is <ctrl-a>)
vim.keymap.set("c", "<, C-e>", "<Home>", { desc = "Move cursor to line end" })

-- Delete to end of command line
-- cmd_map("<C-4>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
-- cmd_map("<Alt-k>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
--
--
-- -- h/l movements (unable to go up/down lines so no need for j/k)
-- -- Move cursor one character left (like `h`)
-- vim.keymap.set("c", "<A-h>", function()
-- 	local pos = vim.fn.getcmdpos()
-- 	if pos > 1 then
-- 		vim.fn.setcmdpos(pos - 1)
-- 	end
-- end, { noremap = true })
--
-- -- Move cursor one character right (like `l`)
-- vim.keymap.set("c", "<A-l>", function()
-- 	local pos = vim.fn.getcmdpos()
-- 	local line_length = vim.fn.strlen(vim.fn.getcmdline())
-- 	if pos <= line_length then
-- 		vim.fn.setcmdpos(pos + 1)
-- 	end
-- end, { noremap = true })
-- simple/crude keymap for same functionality
-- vim.keymap.set("c", "<A-h", "<Left>", { desc = "Move left/prev 1 char" }) --@FAILED: seems like <Alt-h> is not possible, all keymaps thus far have just kicked us back to normal mode
vim.keymap.set("c", "hh", "<Left>", { desc = "Move left/prev 1 char - v2" }) -- @WORKS/@VALIDATED: keymap works but it annoying if need to move > 3 left chars. Checking for suitable alternative in the interim.
vim.keymap.set("c", "<C-l>", "<Right>", { desc = "Move right/next 1 char - v2" })
-- vim.keymap.set("c", "<C-.>", "<Right>", { desc = "Move right/next 1 char - v2" })
