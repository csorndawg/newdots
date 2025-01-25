local conform = require("conform")

if conform then
  conform.setup({
    notify = false, -- Updated field name for notifications
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      yaml = { "yamlfmt" },
      -- For sequential formatters or "stop_after_first" behavior, check plugin documentation
    },
  })
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>f",
  "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>",
  { silent = false, noremap = true }
)

