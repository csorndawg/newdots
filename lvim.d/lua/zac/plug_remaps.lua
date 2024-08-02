
-- todo-comments
vim.keymap.set("n", "<leader>tdn", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "TODO" }})
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>tdp", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
