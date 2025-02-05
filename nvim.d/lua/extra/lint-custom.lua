local lint = require("lint")

local M = {}

-- Linters for each filetype
local linters_by_ft = {
	python = { "ruff" },
	dockerfile = { "hadolint" },
	lua = { "selene" },
	yaml = { "yamllint", "ansible-lint" },
	sh = { "shellcheck" },
	markdown = { "write-good" },
	text = { "write-good" },
	ansible = { "ansible-lint" },
	sql = { "sqlruff" },
}

-- Register linters
lint.linters_by_ft = linters_by_ft

-- @COMMENT OUT IF NEEDED
-- Create autocommand for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lint_augroup,
	callback = function()
		-- Check filetype and lint level
		local ft = vim.bo.filetype
		local supported_filetypes = { bash = true, python = true, yaml = true, docker = true }

		if supported_filetypes[ft] and vim.opt_local.modifiable:get() then
			if _G.lint_level ~= "error" then
				lint.try_lint()
			end
		end
	end,
})

-- Toggle state
M.lint_enabled = false

-- Function to toggle linting on save
M.toggle_lint_on_save = function()
	M.lint_enabled = not M.lint_enabled
	if M.lint_enabled then
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = vim.api.nvim_create_augroup("LintOnSave", { clear = true }),
			pattern = "*",
			callback = function()
				if linters_by_ft[vim.bo.filetype] then
					lint.try_lint()
				end
			end,
		})
		print("Linting on save: Enabled")
	else
		vim.api.nvim_clear_autocmds({ group = "LintOnSave" })
		print("Linting on save: Disabled")
	end
end

-- Linting Keymaps fall under [C]ode Actions Subgroup
-- Keymap to toggle linting
vim.keymap.set("n", "<leader>cl", M.toggle_lint_on_save, { desc = "Toggle lint on save" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>cr",
	":lua update_lint_level('error')<CR>",
	{ desc = "Lint 'Errors' only", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>cw",
	":lua update_lint_level('warning')<CR>",
	{ desc = "Lint 'Warnings' and higher", noremap = true, silent = true }
)

return M
