-- Snippets for custom "cheat" files (".cht",".cheat",".chtf")

local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node

-- starter snippet to easily add tag header with dynamic tags to
ls.add_snippets("cheat", {
	s("tags_cheat", {
		t({ "---", "tags: [ " }),
		c(1, { i(1, "tag1"), i(1, "tag2") }), -- Choice node for varX
		t(", "),
		c(2, { i(2, "tagA"), i(2, "tagB") }), -- Choice node for varY
		t({ " ]", "---" }),
	}),
})
