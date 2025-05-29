-- Python Custom Luasnips Snippets

-- Source/Require luasnip plugin for functionality required for SQL snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("def", {
		t("def "),
		i(1, "func_name"),
		t("("),
		i(2),
		t({ "):", "    " }),
		i(3, "pass"),
	}),
	s("ifmain", {
		t({ 'if __name__ == "__main__":', "    " }),
		i(1, "main()"),
	}),
	-- @TESTME:
	s("defZZZZZ", {
		t("def "),
		i(1, "func_name"),
		t("("),
		i(2),
		t({ "):", "    " }),
		i(3, "pass"),
	}),
}
