local lint = require("lint")

linters = {
  "ansible-lint",
  "commitlint",
  "flake8",
  "hadolint",
  "ruff",
  "selene",
  "shellcheck",
  "sqlruff",
  "writegood",
  "yamllint",
  "zsh",
}

-- test linters
local linters_python = {"ruff","flake8"}
local linters_bash = {"shellcheck"}
local linters_sh = {"shellcheck"}
local linters_sql = {"sqlruff"}
local linters_ansible = {
  'ansible-lint',
  'yamllint'
}
local linters_yaml = {  'yamllint'}

local filetypes = {
  python = linters_python,
  bash = linters_bash,
  sh = linters_sh,
  sql = linters_sql,
  ansible = linters_ansible,
  --ansible_host = linters_ansible,
  yaml = linters_yaml
}

-- enable linters defined in "filetypes" table
for ft, linter_table in pairs(filetypes) do
  table.insert(lint.linters_by_ft,linter_table)
end
