-- Install/Load telescope extensions here
--

vim.keymap.set(
	"n",
	"<Leader>Tf",
	"<cmd>Telescope frecency workspace=CWD path_display={'shorten'} theme=ivy<cr>",
	{ desc = "Frequency extn. test", noremap = true }
)

--
-- require('telescope').load_extension('')
--
--
-- require('telescope').load_extension('')
--
--
-- require('telescope').load_extension('')
--
