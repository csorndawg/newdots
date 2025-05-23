-- ChatGPT starter examples
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

s("ifarith_XPR", {
	t("if (( "),
	i(1, "a > b"),
	t({ " )); then", "\t" }),
	i(2, 'echo "a is greater"'),
	t({ "", "fi" }),
})

s("forfor_XPR", {
	t("for "),
	i(1, "i"),
	t(" in "),
	i(2, "1 2 3"),
	t({ "; do", "\t" }),
	t("for "),
	i(3, "j"),
	t(" in "),
	i(4, "a b c"),
	t({ "; do", "\t\t" }),
	i(5, 'echo "$i $j"'),
	t({ "", "\tdone", "done" }),
})
