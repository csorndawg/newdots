local lint = require("lint")

-- Track the linting level
_G.lint_level = "error" -- Default to showing only errors (disabled state)

-- Function to update linting level
_G.update_lint_level = function(level)
	_G.lint_level = level
	local message = "Linting level set to: " .. level:upper()
	vim.api.nvim_echo({ { message, "InfoMsg" } }, false, {})
end

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

-- Keymaps to toggle linting levels
vim.api.nvim_set_keymap(
	"n",
	"<leader>cli",
	":lua update_lint_level('info')<CR>",
	{ noremap = true, silent = true, desc = "Lint Level: Info" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>clw",
	":lua update_lint_level('warning')<CR>",
	{ noremap = true, silent = true, desc = "Lint Level: Warning" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>cle",
	":lua update_lint_level('error')<CR>",
	{ noremap = true, silent = true, desc = "Lint Level: Error" }
)
