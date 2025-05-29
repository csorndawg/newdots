-- SQL luasnip snippets mock
--
-- Contains 3 types of snippets:
--	- Generic SQL snippets
--	- Postgres-specific snippets
--	- MySQL-specific snippets
--

-- Source/Require luasnip plugin for functionality required for SQL snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- Generic SQL
	s("select", { t("SELECT * FROM "), i(1, "table"), t(";") }),

	-- PostgreSQL specific
	s("serialpk", {
		t({ "id SERIAL PRIMARY KEY" }),
	}),

	-- MySQL specific
	s("autopk", {
		t({ "id INT AUTO_INCREMENT PRIMARY KEY" }),
	}),
}
