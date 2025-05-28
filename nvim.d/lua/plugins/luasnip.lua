return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "benfowler/telescope-luasnip.nvim",
    },
    config = function(_, opts)
      local ls = require("luasnip")

      -- Recommended config
      ls.config.set_config(vim.tbl_deep_extend("force", {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      }, opts or {}))

      -- Load snippets from common sources
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })

      -- Optional filetype extensions
      ls.filetype_extend("lua", { "luadoc" })
      ls.filetype_extend("python", { "pydoc" })
    end,
  },
}


