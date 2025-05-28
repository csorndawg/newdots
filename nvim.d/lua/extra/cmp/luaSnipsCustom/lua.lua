-- All (catch-all, other) styled snippets. Still being developed, tested, 
-- and (hopefully) added 
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


return {
  s("meta", {
    t({
      "--[[",
      "Name:        ",
    }), i(1, "<Script Name>"), t({"", "Author:      "}),
    i(2, "<Your Name>"), t({"", "Path:        "}),
    i(3, "<Repository or File Path>"), t({"", "Keywords:    "}),
    i(4, "<keyword1, keyword2, ...>"), t({"", "Dependencies:"}),
    t({"", "    - "}), i(5, "Lua >= 5.1"), t({"", "    - "}),
    i(6, "neovim, luarocks, etc."), t({"", "Usage:       "}),
    i(7, "How to run or source this file"), t({"", "--]]", ""}),
    i(0)
  }),
}

