-- reference examples:
-- 	https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
-- 	https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- TODO: Add custom Python, SQL, BASH, and other snippets for workflow. Try and find more
-- scalable solution where each FT has its own file within a snippets folder.
-- Also integrating this with nvim-scissors would be the most optimal setup.

-- NOTE: Below snippet works as expected. Continue adding other snippets
-- before removing.
ls.add_snippets("all", {
	s(
		"fmtALL",
		fmt("To {title} {} {}.", {
			ls.insert_node(2, "Name"),
			ls.insert_node(3, "Surname"),
			title = c(1, { t("Mr."), t("Ms.") }),
		})
	),
})
