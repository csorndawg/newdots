-- Simple example that shows how to overwrite a LazyVim-installed
-- plugin default property spec ("config.keywords" in below example)

local todo_comments = require("todo-comments")
if todo_comments then
	-- Overwrite keywords parameter
	todo_comments.setup({
		signs = false, -- disable sidebar icons
		keywords = {
			FIX = {
				-- icon = "!! --->  ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = {
					"FAILED",
					"FIXME",
					"BROKEN",
					"BUG",
					"ERROR",
					"DEBUG",
					"failed",
					"FAIL",
					"broke",
					"broken",
					"IMPORTANT",
					"ISSUE",
					"REMOVE_AFTER_TESTING",
				}, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = {
				-- icon = ">> ",
				color = "todo_color",
				alt = {
					"DECOMM",
					"DECOMMISSION",
					"NEXT",
					"OPT",
					"OPTIMIZE",
					"PRODUCTIONIZE",
					"UNFINISHED",
					"WIP",
				},
			},
			HACK = {
				-- icon = ">> ",
				color = "warning",
				alt = { "HOTFIX", "TEMPFIX", "WORKAROUND", "ONGOING", "HACK" },
			},
			WARN = {
				-- icon = ">> ",
				color = "warning",
				alt = {
					"WARNING",
					"PLAY",
					"MOCK",
					"EXPERIMENTAL",
					"experimental",
					"HELP",
					"help",
					"SKIPPED",
					"DECOMMISSIONED",
					"DECOMMED",
				},
			},
			PERF = {
				-- icon = ">> ",
				alt = {
					"REFACTOR",
					"PQ",
					-- "VALIDATED",
					-- "PASSED",
					-- "CONFIRMED",
					"OPTIM",
					"PERFORMANCE",
					"PERF",
					"FIXED",
					-- "RESOLVED",
				},
			},
			NOTE = { -- icon = ">> ",
				color = "hint",
				alt = { "COPYPASTA", "REMINDER", "info", "note", "reminder", "nextsteps", "NEXTSTEPS", "INFO", "NOTE" },
			},
			TEST = {
				-- icon = "⏲ ",
				color = "test_color",
				alt = {
					"REVIEW",
					"TESTME",
					"TESTING",
					"test",
					"passed",
					"testme",
					"unconfirmed",
					"validated",
					"confirmed",
					"UNTESTED",
					"VALIDATED",
					"PASSED",
					"RESOLVED",
					"CONFIRMED",
					"RC",
				},
			},
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = { "IGNOREME", "IGNORE", "SKIP" }, -- list of file types to exclude highlighting
		},
		-- @TESTING: Testing chatgpt recomm
		colors = {
			test_color = "#d08770", -- Nord orange for TEST
			--todo_color = "#ebcb8b", -- Nord yellow for TODO
			todo_color = "#b48ead", -- Nord yellow for TODO
			-- default = { "Identifier", "#7C3AED" },
			-- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			-- hint = { "DiagnosticHint", "#10B981" },
			-- info = { "DiagnosticInfo", "#2563EB" },
			-- --note = { "Identifier", "#" },
			-- --perf = { "Identifier", "#" },
			-- test = { "Identifier", "#B48EAD" },
			-- todo = { "Identifier", "#d08770" },
			-- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		},
	})
end
