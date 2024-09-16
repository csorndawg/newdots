-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    -- lsp-zero preset
    local lsp = require('lsp-zero').preset({})

    -- Ensure the Python LSP (pyright) and Bash LSP (bashls) are installed
    lsp.ensure_installed({ 'pyright', 'bashls' })

    -- Set up LSP keybindings
    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end)

    lsp.setup()


  end,
}
