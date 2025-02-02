return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "BufReadPre " .. vim.fn.expand("~") .. "/git/obsiddy/**.md",
	opts = {
		require("extra.obsidian").opts, -- source custom options from helper file
	},
	config = function(_, opts)
		require("obsidian").setup(opts) -- ensure settings are still configured
		require("extra.obsidian").setup() -- load keymaps from helper file
	end,
}
