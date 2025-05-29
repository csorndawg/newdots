-- Bash Custom Luasnips Snippets

-- Source/Require luasnip plugin for functionality required for SQL snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("shebang", {
		t({ "#!/usr/bin/env bash", "" }),
	}),
	s("echo", {
		t('echo "'),
		i(1, "Hello, world!"),
		t('"'),
	}),
}
