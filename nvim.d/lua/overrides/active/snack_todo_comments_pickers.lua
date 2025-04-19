-- Flash Picker config code

-- <load plugin code>

local todo = require('nvim.d.lua.extra.todo-comments-custom')
local snacks = require('nvim.d.lua.plugins.snacks.nvim')

optional = true,
vim.keymap.set( "<leader>st", function() snacks.picker.todo() end, desc = "Todo" })
vim.keymap.set( "<leader>st", function() snacks.picker.todo( {keywords = {"TODO", "FIXME", "FIX", "HOTFIX", "BROKEN", "IMPORTANT", "TEST"}}) end, desc = "Todo Tags Main" })


