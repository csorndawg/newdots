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

-- python sample
ls.add_snippets("python", {
	s("hello_looahh_py", {
		t(
			'print(f"This was generated from my custom LuaSnips snippet located in nvim.d/lua/extra/luasnips_custom/python_custom.lua snippet")'
		),
	}),
	s("main", {
		t("def main():", "\n", "\t pass"),
	}),

	-- argparse prelim
	s("argparse", {
		t({ "import argparse", "", "parser = argparse.ArgumentParser()" }),
		t({ "", "parser.add_argument('-" }),
		i(1, "a"),
		t({ "', '--" }),
		i(2, "arg1"),
		t({ "', help='" }),
		i(3, "Help for argument 1"),
		t({ "')" }),
		t({ "", "parser.add_argument('-" }),
		i(4, "b"),
		t({ "', '--" }),
		i(5, "arg2"),
		t({ "', help='" }),
		i(6, "Help for argument 2"),
		t({ "')" }),
		t({ "", "parser.add_argument('-" }),
		i(7, "c"),
		t({ "', '--" }),
		i(8, "arg3"),
		t({ "', help='" }),
		i(9, "Help for argument 3"),
		t({ "')" }),
		t({ "", "", "args = parser.parse_args()" }),
	}),

	-- @CustomSnippet: Create dataframe from postgres DB query
	s("pdsql_rd_XPR", {
		t("import pandas as pd\n"),
		t("from sqlalchemy import create_engine\n\n"),
		t("engine = create_engine('"),
		i(1, "postgresql://user:password@localhost:5432/dbname"),
		t("')\n"),
		t("query = '''"),
		d(2, function()
			return i(1, "SELECT * FROM table_name WHERE column_name = 'value'")
		end, {}),
		t("'''\n"),
		t("df = pd.read_sql(query, engine)\n"),
		t("print(df.head())\n"),
	}),
})
