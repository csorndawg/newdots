local ls = require("luasnip")
local s, t, i, d = ls.snippet, ls.text_node, ls.insert_node, ls.dynamic_node

return {
	s("pdsql_ZXPR", {
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
}
