-- TOML Luasnips snippets

-- Source/Require luasnip plugin for functionality required for SQL snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("pkg", {
		t('[package]\nname = "'),
		i(1, "my_project"),
		t('"\nversion = "'),
		i(2, "0.1.0"),
		t('"\n'),
	}),
	s("dep", {
		t("[dependencies]\n"),
		i(1, "crate"),
		t(' = "'),
		i(2, "0.1"),
		t('"\n'),
	}),
}
