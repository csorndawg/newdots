-- Simple example that shows how to overwrite a LazyVim-installed
-- plugin default property spec ("config.keywords" in below example)

local todo_comments = require("todo-comments")
if todo_comments then
	-- Overwrite keywords parameter
	todo_comments.setup({
		-- @COPYPASTA HERE

		--signs = false, -- show icons in the signs column
		keywords = {
			FIX = {
				-- icon = "!! --->  ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BROKEN", "BUG", "WILLFIX", "WIP", "FIXIT", "IMPORTANT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = {
				-- icon = ">> ",
				color = "info",
				alt = { "UNFINISHED", "OPTIMIZE", "DECOMMISSION", "PRODUCTIONIZE", "SKELETON", "OPTIMIZE" },
			},
			HACK = {
				-- icon = ">> ",
				color = "warning",
				alt = { "INTERIM-FIX", "TEMPFIX", "WORKAROUND", "WILLFIX" },
			},
			WARN = {
				-- icon = ">> ",
				color = "warning",
				alt = { "WARNING", "SKIPPED", "XXX", "DECOMMISSIONED", "DECOMMISSIONING", "COPYPASTA" },
			},
			PERF = {
				-- icon = ">> ",
				alt = { "REFACTOR", "CLEANME", "PQ", "OPTIM", "PERFORMANCE", "FIXED", "RESOLVED" },
			},
			NOTE = { -- icon = ">> ",
				color = "hint",
				alt = { "COPYPASTA", "HELP", "NEXT-STEPS", "REMINDER", "INFO", "HINT" },
			},
			TEST = {
				-- icon = "⏲ ",
				color = "test",
				alt = {
					"REVIEW",
					"TESTME",
					"TESTING",
					"???",
					"VALIDATED",
					"PASSED",
					"INCONCLUSIVE",
					"EXPERIMENTAL",
					"FAILED",
				},
			},
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		-- highlighting of the line containing the todo comment
		-- * before: highlights before the keyword (typically comment characters)
		-- * keyword: highlights of the keyword
		-- * after: highlights after the keyword (todo text)
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = { "IGNOREME", "IGNORE", "SKIP" }, -- list of file types to exclude highlighting
		},
		-- list of named colors where we try to extract the guifg from the
		-- list of highlight groups or use the hex color if hl not found as a fallback
		-- @TODO: Next todo-comments customization to work on - customizing keyword colors to better align with nord/colorscheme
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "DiagnosticWarn", "#FF00FF" },
		},
		-- @TODO: Update below default config if needed
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
		},
	})
end
