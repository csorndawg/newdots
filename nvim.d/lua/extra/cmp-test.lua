-- experimental/test config file

-- test code to have LuaSnip efficiently source example snippets 
require("luasnip.loaders.from_vscode").lazy_load({
        paths = { 
            -- TODO: After confirming snippet paths work, try and replace
            --       "/home/../newdots" with "$HOME/git" so it works on 
            --       all my machines.
            --
            -- friendly-snippets
            "$HOME/.local/share/nvim/lazy/friendly-snippets/",

            -- custom snippets
            --"/home/zc/git/newdots/nvim.d/lua/extra/zsnips/",
            "/home/zc/git/newdots/nvim.d/snippets/",
        },
})
