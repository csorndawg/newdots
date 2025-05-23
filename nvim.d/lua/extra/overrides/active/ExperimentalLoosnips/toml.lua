-- Experimental/Reference Luasnips TOML snippets
local ls = require("luasnip")
local s, t, i, d, sn = ls.snippet, ls.text_node, ls.insert_node, ls.dynamic_node, ls.snippet_node

-- Function to dynamically generate key-value pairs
local function dyn_toml_kv(_, snip)
	local count = tonumber(snip.captures[1]) or 3
	local nodes = {}
	for idx = 1, count do
		table.insert(
			nodes,
			sn(nil, {
				i(1, "key" .. idx),
				t(" = "),
				i(2, '"value' .. idx .. '"'),
				t({ "", "" }),
			})
		)
	end
	return sn(nil, nodes)
end

return {
	-- Usage: type `table3` to generate a table with 3 key-value pairs
	s({ trig = "table(%d+)", regTrig = true, hidden = false }, {
		t("["),
		i(1, "table_name"),
		t({ "]", "" }),
		d(2, dyn_toml_kv, {}, { user_args = {} }),
	}),
}
