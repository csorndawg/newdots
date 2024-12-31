-- @WARNING: Might need to rename if this has naming conflict with plugin. (Unsure how lua handles sourced files with same name, different paths so uncertain if issues will arise)

-- nvim-obsidian Plugin Custom Remaps

-- @NOTE: Convention/Syntax consistency notes to improve whichkey integration and make it easier/less of a cognitive burden to remember
-- 		All remaps will begin with `<leader>o` -- 'o' for Obsidian
-- -- 		All remaps will have a unique chord sequence (signature) added to end of <leader>o base
--
-- remap syntax: <leader>o<unique chord signature>
-- example: `<leader>oo` will "O"pen a new obsidian note

--
-- Preliminary obsidian remaps
-- Default path issue workaround remaps are listed below but commented out until I can test
--

-- load plugin on-demand
vim.keymap.set("n", "<leader>o", "<cmd>lua require('obsidian') <CR>", { noremap = true })

-- open
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { noremap = true })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianOpen ~/git/obsiddy/ <CR>", { noremap = true })

-- new
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { noremap = true })
--vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew $HOME/git/obsiddy/<CMD Input>.md <CR>", { noremap = true })

-- search
--vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { noremap = true })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianSearch ~/git/obsiddy/ <CR>", { noremap = true })

-- rename
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { noremap = true })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianRename ~/git/obsiddy/ <CR>", { noremap = true })

-- tags
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { noremap = true })
