-- custom lunarvim keybinds

-- lua mappings quickstart
--    vim.keymap.set() to define new keymap
--    vim.keymap.set() has 3 mandatory args
--      {mode}: string or table of string containing the mode where the remap happens
--      {lhs}:  string with key sequences to trigger the map
--      {rhs}:  string with either (1) Vim command or (2) Lua function that
--                will be executed when {lhs} is entered
--

-- X closes a buffer
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"

-- Centers cursor when moving 1/2 page down
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"

lvim.keymap.set('n', '<Leader>pon', ':paste<CR>')
lvim.keymap.set('n', '<Leader>pof', ':nopaste<CR>')

-- quick buffer cycling
lvim.keymap.set('n', '<Leader>nn', 'bnext')
lvim.keymap.set('n', '<Leader>bb', 'bnext')

-- normal/command mode switching
lvim.keymap.set('n', '<Leader>..', ':')
lvim.keymap.set('c', '<Leader>..', '<C-c>')


-- insert/normal mode switching
lvim.keymap.set('n', '<Leader>,,', ':')
lvim.keymap.set('i', '<Leader>,,', '<Esc>')

-- TODO:
--    add insert/command mode switch maps
--    review if special insert+1command mode is worthy of remap
--
