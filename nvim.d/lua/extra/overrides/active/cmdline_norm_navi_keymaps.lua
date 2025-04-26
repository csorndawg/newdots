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
-- cmd_map("<C-k>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]])  @shell
-- trying to make as similar/close to vim normal default (<d$>) as possible
-- cmd_map("<C-4>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
-- cmd_map("<Alt-k>", [[<C-\>egetline('.')[getcmdpos()-1:]<CR>]]) -- @BROKEN:
--
-- -- test cmd_map and <C-<number>>
-- cmd_map("<C-0>", "! echo 'Test <C-0>'") -- @BROKEN: Tried testing for simple example but this als failed
