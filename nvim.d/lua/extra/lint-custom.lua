local lint = require("lint")

-- Automatically install missing linters using Mason
local function ensure_linter_installed(linter)
	local mason_registry = require("mason-registry")
	if not mason_registry.is_installed(linter) then
		vim.cmd("MasonInstall " .. linter)
	end
end

-- Define Linters by Filetype
lint.linters_by_ft = {
	python = { "ruff" },
	dockerfile = { "hadolint" },
	lua = { "selene" },
	yaml = { "yamllint", "ansible-lint" },
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	markdown = { "write-good" },
	text = { "write-good" },
	gitcommit = { "commitlint" },
	--html = { "htmlhint" },
	ansible = { "ansible-lint" },
	sql = { "sqlfluff" },
}

-- Ensure linters are installed
for _, linters in pairs(lint.linters_by_ft) do
	for _, linter in ipairs(linters) do
		ensure_linter_installed(linter)
	end
end

-- Track the linting level
_G.lint_level = "error" -- Default to showing only errors (disabled state)

-- Function to update linting level
_G.update_lint_level = function(level)
	_G.lint_level = level
	local message = "Linting level set to: " .. level:upper()
	vim.api.nvim_echo({ { message, "InfoMsg" } }, false, {})
end

-- @TODO: Create keymap to override the below AUGROUP and disable or mute linting, until I reenbale with another similar keymap
-- Create autocommand for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lint_augroup,
	callback = function()
		-- checks linters_by_ft table from above for a possible linter match
		if _G.lint_level ~= "error" then
			require("lint").try_lint()
		end
		--require("lint").try_lint()
		-- Check filetype and lint level
		--		local ft = vim.bo.filetype
		--		local supported_filetypes =
		--			{ bash = true, python = true, yaml = true, sql = true, text = true, ansible = true, docker = true }
		--
		--		if supported_filetypes[ft] and vim.opt_local.modifiable:get() then
		--			if _G.lint_level ~= "error" then
		--				lint.try_lint()
		--			end
		--	end
	end,
})

-- Keymaps to toggle linting levels
vim.api.nvim_set_keymap(
	"n",
	"<leader>cw",
	":lua update_lint_level('warning')<CR>",
	{ desc = "Lint Level Warning", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ce",
	":lua update_lint_level('error')<CR>",
	{ desc = "Lint Level Error", noremap = true, silent = true }
)
