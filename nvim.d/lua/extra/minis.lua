-- Oneoff/Adhoc custom plugin remaps

-- ListChars Toggle
vim.keymap.set("n", "<Leader>ct", <cmd>lua require('nvim-listchars').ListcharsToggle<CR>, {noremap = true})
