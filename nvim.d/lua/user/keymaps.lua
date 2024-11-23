-- NVIM CORE REMAPS
--
--
-- LUA REMAP SYNTAX:  vim.keymap.set('<mode flag>', '<new mapping trigger>', '<keys/cmnds executed>')
-- EXAMPLE REMAP: vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--
--   -- Above remap runs `:nohlsearch` when `<ESC>` entered in normal ('n') mode
--
-- NOTES: 
--   -- `<cmd>` equals hitting `:` in Normal mode (ie. switch from Normal to Command Mode)
-- 
--


-- `<SPACE>;` switches from NORMAL to COMMAND mode
vim.keymap.set('n', '<leader>;', '<cmd>')

-- `<SPACE>,` switches from NORMAL to INSERT
vim.keymap.set('n', '<leader>,', 'i')
