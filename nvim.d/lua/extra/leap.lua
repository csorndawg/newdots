-- GOAL: configure LEAP to use my custom mappings. Even with the code snippet on the project's Github I still am not sure how to configure the plugins/leap.lua file to make this happen. Trying this as potential workaround but not expecting this to work.

-- Bidirectional `s` in Normal mode
vim.keymap.set('n',        's', '<Plug>(leap)')
vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')
