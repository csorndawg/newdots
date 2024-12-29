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
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				-- NOTE: obsidian usage on WSL has dependency
				-- on wsl-open (https://gitlab.com/4U6U57/wsl-open)
				--name = "WSL ASUS",
				name = "Version Control",

				-- Git Repo/Version Controlled Path
				path = "~/git/obsiddy",

				-- WSL Path
				--path = "/mnt/c/Users/zaccs/Documents/Obsidian-Vault/obsiddy",
			},

			-- Remote machine notes/workspace
			--			{
			--				name = "remote-repo",
			--				path = "~/git/dataops_bible/obsidian/remotes",
			--			},
		},

		-- see below for full list of options 👇
	},
}
