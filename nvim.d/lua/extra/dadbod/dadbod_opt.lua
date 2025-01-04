-- Vim-Dadbod/Vim-Dadbod-Ui Options

-- uncomment below to automatically execute table helper query after expansion
-- let g:db_ui_auto_execute_table_helpers = 1

-- Disable mappings in Javascript buffers (for Mongodb)
--vim.g.db_ui_disable_mappings_javascript = 1

-- @FIXME: After testing remove one of the 2 paths below
-- default save location for dbui stuff
-- if it includes connection strings - use fortknox path, otherwise use dataops_bible
--vim.g.db_ui_save_location = "~/git/dataops_bible/runbooks/databases/dbui_queries/nvim"
vim.g.db_ui_save_location = vim.fn.expand("$HOME") .. "/git/fortknox/creds/dbui/nvim"
