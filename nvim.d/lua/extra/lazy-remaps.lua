-- Plugin Remaps

-- Lua Locals
local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true, silent = false }
local term_opts = { silent = true }
local remapp = vim.api.nvim_set_keymap -- shorten NVIM remap function call

-- Lua Imports
require("user.autocmds")

-- sample
--nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>

-- Fugitive
remapp = { "n", "<leader>gs", ":Git <cr>", noremap = true }
remapp = { "n", "<leader>gd", ":Gvdiffsplit! <cr>", noremap = true }
--remapp = { "n", "<leader>ga", ":Git add %<Tab><cr>", noremap = true }
remapp = { "n", "<leader>ga", ":Git add ", noremap = true }

-- DAP
remapp = { "n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", noremap = true }
remapp = { "n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", noremap = true }
remapp = { "n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", noremap = true }
remapp = { "n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", noremap = true }
-- DAP lunarvim whichkey copypasta
remapp = { "n", "<leader>db ", "<cmd>lua require'dap'.step_back()<cr>", noremap = true }
remapp = { "n", "<leader>di ", "<cmd>lua require'dap'.step_into()<cr>", noremap = true }
remapp = { "n", "<leader>do ", "<cmd>lua require'dap'.step_over()<cr>", noremap = true }
remapp = { "n", "<leader>dq ", "<cmd>lua require'dap'.close()<cr>", noremap = true }
remapp = { "n", "<leader>dr ", "<cmd>lua require'dap'.repl.toggle()<cr>", noremap = true }
remapp = { "n", "<leader>dt ", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", noremap = true }
remapp = { "n", "<leader>du ", "<cmd>lua require'dap'.step_out()<cr>", noremap = true }

-- @FIXME: Remap failed when tested
-- nvim-conform: auto (f)ormat (d)isable/(e)nable autocmds
--remapp = { "n", "<leader>fd", "<cmd>FormatDisable<cr>", noremap = true }
--remapp = { "n", "<leader>fe", "<cmd>FormatEnable <cr>", noremap = true }
