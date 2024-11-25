-- goto-preview custom mapping

-- CUSTOM MAPPINGS
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})


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
