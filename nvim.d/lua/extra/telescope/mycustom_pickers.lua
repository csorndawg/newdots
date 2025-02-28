-- Configuration code for personal/custom Telescope functionality
local builtin = require("telescope.builtin")

-- use telescope to stash an idea in a VC "ideas" file
vim.keymap.set("n", "<leader>fi", function()
  builtin.find_files({
    prompt_title = "Idea Bins",
    cwd = vim.fn.expand("~/git/taskwarra/ideas"),  -- Adjust if needed
    hidden = true,
  })
end, { desc = "Ideas Telescope" })

