return {
   -- lazy.nvim
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", 
    opts = {
      --snippetDir = "path/to/your/snippetFolder",
      -- custom snippets dir:  "$HOME/dotfiles/nvim.d/lua/extra/custom_luasnips.lua"
      --snippetDir = "/home/zc/git/newdots/nvim.d/lua/extra/custom_luasnips.lua",
      --snippetDir = "$HOME/dotfiles/nvim.d/lua/extra/custom_luasnips.lua",
    }
  },
}
