-- Extra configuration for  https://github.com/nvim-telescope/telescope-live-grep-args.nvim

-- std. action
vim.keymap.set(
	"n",
	"<leader>Tg",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ desc = "Live ArgGrep", noremap = true }
)

-- extra actions
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

vim.keymap.set(
	"n",
	"<leader>Tc",
	live_grep_args_shortcuts.grep_word_under_cursor,
	{ desc = "Grep cursor word", noremap = true }
)

vim.keymap.set(
	"n",
	"<leader>Tv",
	live_grep_args_shortcuts.grep_visual_selection,
	{ desc = "Grep visual selection", noremap = true }
)
