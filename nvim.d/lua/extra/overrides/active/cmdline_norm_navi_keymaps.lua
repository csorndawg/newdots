-- Keymaps to have some Normal-mode like movements available in Cmd/Ex mode
-- @NOTE: First iteration, might need to retune in future
--
-- local function cmd_map(lhs, rhs)
-- 	vim.api.nvim_set_keymap("c", lhs, rhs, { noremap = true, silent = true })
-- end

-- Line movements
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Move cursor to line start" }) -- @PASSED: Works, but <C-a> needs to be entered 2x to work (because Tmux prefix also is <ctrl-a>)
vim.keymap.set("c", "<, C-e>", "<Home>", { desc = "Move cursor to line end" })

-- Delete to end of command line
-- cmd_map("<C-4>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
-- cmd_map("<Alt-k>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:

vim.keymap.set("c", "<C-b>", "<C-Left>", { desc = "Move back word (cmdline)" })
vim.keymap.set("c", "<C-f>", "<C-Right>", { desc = "Move forward word (cmdline)" })

-- Line movements
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Move cursor to line start" }) -- @PASSED: Works, but <C-a> needs to be entered 2x to work (because Tmux prefix also is <ctrl-a>)
vim.keymap.set("c", "<, C-e>", "<Home>", { desc = "Move cursor to line end" })

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

-- swapping custom "hh" keymap with <C-h> default map (move left 1 char, no delete)
vim.keymap.set("c", "hh", "<C-h>", { noremap = false, desc = "Move left/prev 1 char - v2" })
vim.keymap.set("c", "<C-h>", "<Left>", { desc = "Move left/prev 1 char - v2" })
vim.keymap.set("c", "<C-l>", "<Right>", { desc = "Move right/next 1 char - v2" })

-- @NOTE:
-- Starting all Cmdline delete word(s) with `<A-XX>` where hotkey closely mirrors it's normal mode key equivalent
-- Can use <F1>-<F12> plus <S-F1>-<S-F12> (shift F1-F12) if more Cmdline prefixes needed

-- delete entire line like "dd"
vim.keymap.set("c", "<A-d><A-d>", "<C-e><c-u>", { desc = "Delete line" }) -- @PASSED: this keymap deleted all text in cmdline and remained in cmdline mode
-- delete from cursor to start of line like "d0"
vim.keymap.set("c", "<A-d>e", "<C-u>", { desc = "Delete from cursor to SOL" }) -- think cmdline delete "<Alt-d>" to End of line "e"

-- @WIP: Need to make function to get current position index, jump to end of Cmdline and delete chars until back to position index
-- delete from cursor to end of line like "d$"
vim.keymap.set(
	"c",
	"<A-0>",
	"<C-u>",
	{ desc = "Dummy keymap to test keymap trigger, still working on code to delete form cusror to EOL" }
)
