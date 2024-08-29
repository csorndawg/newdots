-- For all new features that need to be tested before being added
-- to my "main branch" init.lua (or one of its submodules)

-- HELP/INFO:
--
-- Convert vimscript options to lua with `vim.o` (booleans) or `vim.opt` (lists)
--
-- boolean example:  
--   vimscript:  set nohlsearch
--   lua:  vim.o.nohlsearch = true
--
-- vimscript list example: 
--   vimscript: 
--   lua: vim.opt.wildmode =  { 'list', 'full' }

-- TODO
-- options to work on later
-- set history=1500
-- " autocomplete settings
-- set completeopt+=preview
-- set completeopt+=menuone
-- set completeopt+=longest

-- experimental options
vim.o.nohlsearch = true
vim.opt.wildmode =  { 'list', 'full' }
