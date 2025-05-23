-- Experimental/Reference Luasnips Python Snippets
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node

-- Pandas Dataframe from Excel
s("pdexcel_XPR", {
	t("import pandas as pd\n"),
	t("df = pd.read_excel('"),
	i(1, "file_path.xlsx"),
	t("')\n"),
	t("print(df.head())\n"),
})

-- Pandas fetch (read_csv) and query (df.query()) data
s("querydf_XPR", {
	t("import pandas as pd\n"),
	t("df = pd.read_csv('"),
	i(1, "file_path.csv"),
	t("')\n"),
	t("result = df.query('"),
	i(2, "column_name == 'value'"),
	t("')\n"),
	t("print(result)\n"),
})

-- pd.read_sql snippet
-- local s, t, i, d = ls.snippet, ls.text_node, ls.insert_node, ls.dynamic_node

s("pdsql_rd_XPR", {
	t("import pandas as pd\n"),
	t("from sqlalchemy import create_engine\n\n"),
	t("engine = create_engine('"),
	i(1, "sqlite:///database.db"),
	t("')\n"),
	t("query = '''"),
	d(2, function()
		return i(1, "SELECT * FROM table_name WHERE column_name = 'value'")
	end, {}),
	t("'''\n"),
	t("df = pd.read_sql(query, engine)\n"),
	t("print(df.head())\n"),
})
