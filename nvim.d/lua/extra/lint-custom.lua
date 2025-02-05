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
