-- Ansible-specific YAML luasnips snippets

-- -- Source/Require luasnip plugin for functionality required for SQL snippets
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node

-- -- TOML Luasnips snippets

-- Source/Require luasnip plugin for functionality required for SQL snippets
local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local i = ls.insert_node
local r = ls.restore_node
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
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

-- @TESTME: Test ansible YAML snippets work with simple test case.

-- Method 1: No Ansible-Only YAML filetype distinction
ls.add_snippets("yaml", {
	s("ansibleYamlGenericSnipsTest", {
		t("ANSIBLE (GENERIC YAML, NO ANSIBLE DISTINTION) LUASNIPS SNIPPETS SOURCED SUCCESSFULLY  !!!"),
	}),
})

-- Method 2: Ansible-Only filetype specified
ls.add_snippets("ansible.yaml", {
	s("ansibleYamlSnipsTest", {
		t("ANSIBLE-ONLY YAML LUASNIPS SNIPPETS SOURCED SUCCESSFULLY  !!!"),
	}),
	s("ansibleYamlSnipsTest2", {
		t("ANSIBLE-ONLY YAML SNIPPET ALSO SOURCED SUCCESFULLY"),
	}),
})

--
-- -- <ADD ANSIBLE-SPECIFIC YAML SNIPPETS CODE HERE>
-- -- <AND HERE...>
--
