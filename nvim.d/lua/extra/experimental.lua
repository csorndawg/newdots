-- goto-preview custom mapping

-- CUSTOM MAPPINGS
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

-- convert vimscript example copied from goto-preview docs into Luascript
--
-- `vim.cmd( [[]] )` transform vimscript to Lua, and `[[ ]]` allows
-- the vimscript commands to be passed as a single MULTILINE string, which
-- allows for all the vimscript commands to be passed together
vim.cmd([[
  nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
  nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
  nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
  nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
  nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
  nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
]])

-- obsidian.nvim
-- -- all remaps will begin with `<leader>o` -- 'o' for Obsidian
-- -- all remaps will have a unique chord sequence (signature) added to end of <leader>o base
-- -- -- ^^ above structure makes whichkey integration easier
--
-- remap syntax: <leader>o<unique chord signature>
-- example: `<leader>oo` will "O"pen a new obsidian note

-- preliminary obsidian remaps
-- load plugin on-demand
vim.keymap.set("n", "<leader>o", "<cmd>lua require('obsidian') <CR>", { noremap = true })
-- open
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { noremap = true })
-- new
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { noremap = true })
-- search
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { noremap = true })
-- rename
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { noremap = true })
-- tags
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { noremap = true })
