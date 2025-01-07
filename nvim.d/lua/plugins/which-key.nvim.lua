return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},

			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},

			-- @TODO: Replicate below logic to add individual keymaps. For nested keymaps see "d" debug whichmap
			{ "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
			{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
			{ "<leader>bd", "<cmd>bd<cr>", "Delete Buffer" },
			{ "<leader>gs", "<cmd>Git <cr>", "Git Status" },
			{ "<leader>gd", "<cmd>Gvdiffsplit! <cr>", "Git 3-Way Vertical Split" },
			{ "<leader>ga", "<cmd>Git add <cr>", "Git add current file" },



			-- DAP/DEBUG which-keys

			--
			-- LUNARVIM COPYPASTA
			--
			-- b = {
			--   name = "Buffers",
			--   j = { "<cmd>BufferLinePick<cr>", "Jump" },
			--   f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
			--   b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
			--   n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
			--   W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
			--   -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
			--   e = {
			--     "<cmd>BufferLinePickClose<cr>",
			--     "Pick which buffer to close",
			--   },
			--   h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
			--   l = {
			--     "<cmd>BufferLineCloseRight<cr>",
			--     "Close all to the right",
			--   },
			--   D = {
			--     "<cmd>BufferLineSortByDirectory<cr>",
			--     "Sort by directory",
			--   },
			--   L = {
			--     "<cmd>BufferLineSortByExtension<cr>",
			--     "Sort by language",
			--   },
			-- },

			--g = {
			--name = "Git",
			--   g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
			--   j = { "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", "Next Hunk" },
			--   k = { "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", "Prev Hunk" },
			--   l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			--   L = { "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", "Blame Line (full)" },
			--   p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			--   r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			--   R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			--s = { "<cmd>lua require 'fugitive'.Git <cr>", "Git Status" },
			--   u = {
			--     "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			--     "Undo Stage Hunk",
			--   },
			--   o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			--   b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			--   c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			--   C = {
			--     "<cmd>Telescope git_bcommits<cr>",
			--     "Checkout commit(for current file)",
			--   },
			--   d = {
			--     "<cmd>Gitsigns diffthis HEAD<cr>",
			--     "Git Diff",
			--   },
			-- },
			--   l = {
			--       name = "LSP",
			--       a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			--       d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
			--       w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
			--       f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
			--       i = { "<cmd>LspInfo<cr>", "Info" },
			--       I = { "<cmd>Mason<cr>", "Mason Info" },
			--       j = {
			-- 	"<cmd>lua vim.diagnostic.goto_next()<cr>",
			-- 	"Next Diagnostic",
			--       },
			--       k = {
			-- 	"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			-- 	"Prev Diagnostic",
			--       },
			--       l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			--       q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			--       r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			--       s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			--       S = {
			-- 	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			-- 	"Workspace Symbols",
			--       },
			--       e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
			-- },
			-- s = {
			-- name = "Search",
			-- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			-- c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			-- f = { "<cmd>Telescope find_files<cr>", "Find File" },
			-- h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			-- H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
			-- M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			-- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			-- R = { "<cmd>Telescope registers<cr>", "Registers" },
			-- t = { "<cmd>Telescope live_grep<cr>", "Text" },
			-- k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			-- C = { "<cmd>Telescope commands<cr>", "Commands" },
			-- l = { "<cmd>Telescope resume<cr>", "Resume last search" },
			-- p = {
			--   "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
			--   "Colorscheme with Preview",
			-- },
			-- },
			--},
		},
	},
}
