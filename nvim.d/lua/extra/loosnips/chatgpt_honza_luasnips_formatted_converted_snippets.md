Bulk list of selected useful honza snippets converted into luasnips lua format. 

NOTE: Each of the snippets, belongs to a snippet type (loosnips/x_custom.lua). The type to add it to is not listed explicitly, but you should be able to infer it from the snippet name". 
For example "withpy" is a python snippet, therefore it should be added to loosnips/python_custom.lua. 

```
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("indx_mkr", { t("create index "), i(1, "index_name"), t(" on "), i(2, "table"), t("("), i(3, "column"), t(");") }),

    s("s*", { t("select * from "), i(1, "table") }),

    s("caseb", {
        t({ "case " }), i(1, "word"), t({ " in", "\t" }), i(2, "pattern"), t({ ")", "\t\t" }),
        i(0), t({ ";;", "esac" })
    }),

    s("forb", {
        t("for "), i(1, "needle"), t(" in "), i(2, "haystack"), t(" ; do"), t({ "", "\t" }),
        i(0), t({ "", "done" })
    }),

    s("bash", { t("#!/usr/bin/env bash") }),

    s("ifb", {
        t("if [ "), i(1, "condition"), t(" ]; then"), t({ "", "\t" }),
        i(0), t({ "", "fi" })
    }),

    s("shellflags", {
        t('__ScriptVersion="'), i(1, "version"), t({ '"', "", "#===  FUNCTION  ================================================================" }),
        t({ "", "#         NAME:  usage", "#  DESCRIPTION:  Display usage information.", "#===============================================================================" }),
        t({ "", "function usage ()", "{" }),
        t({ '\techo "Usage :  $' }), i(2, "0"), t({ ' [options] [--]"', "", "    Options:", "    -h|help       Display this message", "    -v|version    Display script version", "}" }),
        t({ "", "#-----------------------------------------------------------------------", "#  Handle command line arguments", "#-----------------------------------------------------------------------", "" }),
        t("while getopts \":hv\" opt"), t({ "", "do", "\tcase $opt in", "" }),
        t("\t\th|help     )  usage; exit 0   ;;"), t({ "", "\t\tv|version  )  echo \"$" }), i(2, "0"), t(" -- Version $__ScriptVersion\"; exit 0   ;;"),
        t({ "", "\t\t* )  echo -e \"\\n  Option does not exist : $OPTARG\\n\"", "\t\t  usage; exit 1   ;;", "  esac", "done", "shift $(($OPTIND-1))" })
    }),

    s("funb", {
        t("function "), i(1, "function_name"), t("() {"), t({ "", "\t" }),
        i(0), t({ "", "}" })
    }),

    s("frumpy", { t("from "), i(1, "package"), t(" import "), i(2, "module") }),

    s("withpy", {
        t("with "), i(1, "expr"), t(" as "), i(2, "var"), t(":"),
        t({ "", "\t" }), i(0)
    }),

    s("funpy", {
        t("def "), i(1, "fname"), t("("), i(2, "self"), t("):"), t({ "", "\t\"\"\"" }),
        i(3, "docstring for fname"), t("\"\"\""), t({ "", "\t" }), i(0)
    }),

    s("ifpy", { t("if "), i(1), t(":"), t({ "", "\t" }), i(0) }),

    s("elpy", { t("else:"), t({ "", "\t" }), i(0) }),

    s("elifpy", { t("elif "), i(1), t(":"), t({ "", "\t" }), i(0) }),

    s("forpy", {
        t("for "), i(1, "item"), t(" in "), i(2, "items"), t(":"),
        t({ "", "\t" }), i(0)
    }),

    s("retpy", { t("return "), i(0) }),

    s("trypy", {
        t("try:"), t({ "", "\t" }), i(1), t({ "", "except " }), i(2, "Exception"), t(" as "), i(3, "e"), t(":"),
        t({ "", "\t" }), i(0)
    }),

    s("tryelpy", {
        t("try:"), t({ "", "\t" }), i(1), t({ "", "except " }), i(2, "Exception"), t(" as "), i(3, "e"), t(":"),
        t({ "", "\t" }), i(4, "raise e"), t({ "", "else:" }), t({ "", "\t" }), i(0)
    }),

    s("testgwt_all", {
        t("# given: "), i(1), t({ "", "# when: " }), i(2), t({ "", "# then: " }), i(3)
    }),

    s("lambda_py", { i(1, "var"), t(" = lambda "), i(2, "vars"), t(" : "), i(0, "action") }),

    s("argspy", { t("*args"), i(1, ","), i(0) }),

    s("kwa_py", { t("**kwargs"), i(1, ","), i(0) }),

    s("akw_py", { t("*args, **kwargs"), i(1, ","), i(0) }),

    s("lcpy", { t("[ "), i(1), t(" for "), i(2), t(" in "), i(3), t(" ]"), i(0) }),

    s("dcpy", { t("{ "), i(1), t(": "), i(2), t(" for "), i(3), t(" in "), i(4), t(" }"), i(0) }),

    s("fprint", { t('print(f"'), i(0), t('")') }),

    s("BEGIN_awk", {
        t("BEGIN {"), t({ "", "\t" }), i(0), t({ "", "}" })
    }),

    s("for_awk", {
        t("for ("), i(2, "i"), t(" = 0; "), i(2), t(" < "), i(1, "n"), t("; "), i(3, "++i"), t(") {"),
        t({ "", "\t" }), i(0), t({ "", "}" })
    }),

    s("print_awk", { t('{print '), i(1, "$NF"), t("}") })
}

```
