return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},

			-- @TODO: Replicate below logic to add individual keymaps. For nested keymaps see "d" debug whichmap
			--{ "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
			{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
			{ "<leader>bd", "<cmd>bd<cr>", "Delete Buffer" },
			{ "<leader>gs", "<cmd>Git <cr>", "Git Status" },
			{ "<leader>gd", "<cmd>Gvdiffsplit! <cr>", "Git 3-Way Vertical Split" },
			{ "<leader>ga", "<cmd>Git add <cr>", "Git add current file" },

			--			-- TROUBLE
			--			t = {
			--				name = "Trouble",
			--				r = { "<cmd>Trouble lsp_references<cr>", "References" },
			--				f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
			--				d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
			--				q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
			--				l = { "<cmd>Trouble loclist<cr>", "LocationList" },
			--				w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
			--			},
			-- DAP/DEBUG which-keys
			-- @experimental
			--{ "<leader>db ", "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			--{ "<leader>di ", "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			--{ "<leader>do ", "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			--{ "<leader>dq ", "<cmd>dap'.close()<cr>", "Quit" },
			--			{ "<leader>dr ", "<cmdlua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
			--{ "<leader>dt ", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			--{ "<leader>du ", "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
			-- C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
			-- U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
			-- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			-- d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			-- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			-- p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
			-- s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },

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
			--			d = {
			--				name = "Debug",
			--				t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			--				b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			--				-- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			--				-- C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
			--				-- d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			--				-- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			--				i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			--				o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			--				u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
			--				-- p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
			--				r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
			--				-- s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
			--				q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			--				-- U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
			--			},
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
