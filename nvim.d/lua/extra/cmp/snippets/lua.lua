-- ~/.config/nvim/snippets/lua.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("fn", {
		t({ "function " }),
		i(1, "name"),
		t({ "()", "  " }),
		i(2, "-- body"),
		t({ "", "end" }),
	}),

	s("req", {
		t("local "),
		i(1, "mod"),
		t(' = require("'),
		i(2),
		t('")'),
	}),

	s("triggername", {
		t("✅ It works!"),
	}),
}
