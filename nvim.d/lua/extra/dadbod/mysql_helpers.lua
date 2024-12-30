--  Custom MySQL Table Helper Queries
--  Source: https://github.com/kristijanhusak/vim-dadbod-ui/blob/master/doc/dadbod-ui.txt

vim.g.db_ui_table_helpers = {
	mysql = {
		Peek = "select count(*) from {optional_schema}{table} LIMIT 250",
		CountAll = "select count(*) from {optional_schema}{table}",
		Explain = "EXPLAIN ANALYZE {last_query}",
	},
}
