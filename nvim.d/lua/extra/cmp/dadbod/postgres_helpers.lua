--  Custom Postgres Table Helper Queries
--  Source: https://github.com/kristijanhusak/vim-dadbod-ui/blob/master/doc/dadbod-ui.txt

vim.g.db_ui_table_helpers = {
	postgresql = {
		Peek = "select count(*) from {optional_schema}{table} LIMIT 250",
		CountAll = "select count(*) from {optional_schema}{table}",
		Explain = "EXPLAIN ANALYZE {last_query}",
	},
}

-- uncomment below to automatically execute table helper query after expansion
-- let g:db_ui_auto_execute_table_helpers = 1
