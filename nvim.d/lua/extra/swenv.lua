require('swenv').setup({
  -- Should return a list of tables with a `name` and a `path` entry each.
  -- Gets the argument `venvs_path` set below.
  -- By default just lists the entries in `venvs_path`.
  get_venvs = function(venvs_path)
    return require('swenv.api').get_venvs(venvs_path)
  end,

  -- Path passed to `get_venvs`.
  -- venv xdg: '~/.local/state/python/venvs'
  venvs_path = vim.fn.expand('~/venvs'),
  -- Something to do after setting an environment, for example call vim.cmd.LspRestart
  post_set_venv = nil,
})


-- swenv remaps
--   follow <leader>e<mnemonic> remap pattern
--
-- remapping examples
--   vim.keymap.set("n", "<LHS>", "<RHS>", { noremap = true })
--   vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ec", "<cmd>lua require('swenv.api').get_current_venv()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ep", "<cmd>lua require('swenv.api').pick_venv()<CR>", { noremap = true })

